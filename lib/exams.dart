import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './user_details.dart';
import './calendar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'database.dart';

class Exams extends StatefulWidget {
  @override
  _ExamsState createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  @override
  Widget build(BuildContext context) {
    int teal_dark = 0xFF05989B;
    List<String> moduleList = UserDetails().getModules();

    double width = (MediaQuery.of(context).size.width - 50) / 3;

    final database = Provider.of<AppDatabase>(context);
    // final scaffold_key = new GlobalKey<ScaffoldState>();

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Exams',
              style: TextStyle(fontSize: 50, color: Color(teal_dark))),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.event),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return Calendar_dialog(database);
                  },
                );
              },
              iconSize: 40,
              color: Color(teal_dark),
            ),
            new IconButton(
              icon: new Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) =>
                        addExamDialog(context, moduleList, database));
              },
              iconSize: 40,
              color: Color(teal_dark),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: database.watchAllTests(),
            builder: (context, AsyncSnapshot<List<Test>> snapshot) {
              final tests = snapshot.data ?? List();
              bool data_exists = tests.isEmpty;

              return data_exists
                  ? Center(
                      child: Text(
                        "No Exams !",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(15),
                      child: Column(children: <Widget>[
                        Card(
                          color: Color(teal_dark),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                          child: Container(
                            height: 45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                  width: width,
                                  child: Text(
                                    "Date & Time",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  color: Colors.white54,
                                  width: 2.5,
                                ),
                                SizedBox(
                                  width: width,
                                  child: Text(
                                    "Module",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  color: Colors.white54,
                                  width: 2.5,
                                ),
                                SizedBox(
                                  width: width,
                                  child: Text(
                                    "Venue",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: new ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (_, int index) {
                                    final itemTest = tests[index];
                                    return GestureDetector(
                                      child:
                                          ItemExam(itemTest, database, width),
                                      onTap: () {
                                        showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) =>
                                                    viewExamDialog(
                                                        context,
                                                        moduleList,
                                                        itemTest,
                                                        database))
                                            .then((_) => setState(() {}));
                                      },
                                    );
                                  },
                                  itemCount: tests.length,
                                )))
                      ]));
            }),
      ),
    );
  }
}

class ItemExam extends StatefulWidget {
  Test itemTest;
  AppDatabase database;
  double width;

  ItemExam(this.itemTest, this.database, this.width);

  @override
  _ItemExamState createState() => _ItemExamState();
}

class _ItemExamState extends State<ItemExam> {
  @override
  Widget build(BuildContext context) {
    String location = widget.itemTest.location, module = widget.itemTest.module;
    var date = widget.itemTest.date != null ? widget.itemTest.date : "",
        time = widget.itemTest.time != null ? widget.itemTest.time : "";

    return new Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            //   colors: [Color(0xFF04B46D), Color(0xFF119DA4)],

            colors: [Color(0xFF00cdac), Color(0xFF02aab0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    child: Text(
                      date.toString().isEmpty
                          ? "-"
                          : DateFormat("hh:mm a").format(time).toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    width: widget.width,
                    height: 14,
                  ),
                  Container(color: Colors.white54, height: 2.5),
                  SizedBox(
                    child: Text(
                      date.toString().isEmpty
                          ? "-"
                          : DateFormat("EEE, dd MMM").format(date).toString(),
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    width: widget.width,
                    height: 14,
                  ),
                ],
              ),
              width: widget.width,
            ),
            Container(color: Colors.white54, width: 2.5),
            SizedBox(
              width: widget.width,
              child: Text(
                module,
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              color: Colors.white54,
              width: 2.5,
            ),
            SizedBox(
              width: widget.width,
              child: Text(
                location,
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

addExamDialog(BuildContext context, List modulesList, AppDatabase database) {
  String _dateExam = " - ", _timeExam = " - ", _location = "", _module;
  var dateWithoutFormat, timeWithoutFormat;
  int teal_bg = 0xFF02aab0, teal_dark = 0xFF05989B;
  var scrollController = new ScrollController();

  if (modulesList.isNotEmpty) _module = modulesList[0];

  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(teal_bg),
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
            height: 390,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(teal_dark),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      Text(
                        "Exam",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.transparent,
                        size: 50,
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Expanded(
                      child: SingleChildScrollView(
                          controller: scrollController,
                          child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: modulesList.isEmpty
                                      ? SizedBox(
                                          width: double.infinity,
                                          height: 45,
                                          child: Center(
                                              child: Text(
                                            "No modules found \n Please add modules in profile",
                                            style: TextStyle(
                                                color: Color(teal_bg)),
                                            textAlign: TextAlign.center,
                                          )))
                                      : DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            dropdownColor: Colors.white,
                                            isExpanded: true,
                                            value: _module,
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Color(teal_bg),
                                            ),
                                            iconSize: 30,
                                            elevation: 0,
                                            style: TextStyle(
                                                color: Color(teal_bg),
                                                fontSize: 20),
                                            onChanged: (newValue) {
                                              setState(() {
                                                _module = newValue;
                                              });
                                            },
                                            items: modulesList.map((value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  decoration: InputDecoration(
                                    labelText: 'Venue',
                                    focusColor: Colors.white,
                                    labelStyle: new TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  onChanged: (String new_location) {
                                    setState(() {
                                      _location = new_location;
                                    });
                                  },
                                ),
                                SizedBox(height: 20),
                                Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.schedule,
                                                color: Color(teal_bg),
                                                size: 15,
                                              ),
                                              SizedBox(width: 5),
                                              Text(_timeExam,
                                                  style: TextStyle(
                                                      color: Color(teal_bg),
                                                      fontSize: 15)),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Icon(Icons.calendar_today,
                                                  color: Color(teal_bg),
                                                  size: 15),
                                              SizedBox(width: 5),
                                              Text(_dateExam,
                                                  style: TextStyle(
                                                      color: Color(teal_bg),
                                                      fontSize: 15)),
                                            ],
                                          ),
                                          ButtonTheme(
                                              minWidth: 5,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Color(teal_bg),
                                                ),
                                                onPressed: () {
                                                  DatePicker.showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime:
                                                          DateTime(2020, 1, 1),
                                                      maxTime:
                                                          DateTime(2050, 6, 7),
                                                      onConfirm: (date) {
                                                    setState(() {
                                                      dateWithoutFormat = date;
                                                      _dateExam = DateFormat(
                                                              "dd MMM, yyyy")
                                                          .format(
                                                              dateWithoutFormat);

                                                      DatePicker
                                                          .showTime12hPicker(
                                                              context,
                                                              showTitleActions:
                                                                  true,
                                                              onConfirm:
                                                                  (time) {
                                                        setState(() {
                                                          timeWithoutFormat =
                                                              time;
                                                          _timeExam = DateFormat(
                                                                  "hh:mm a")
                                                              .format(
                                                                  timeWithoutFormat);
                                                        });
                                                      },
                                                              currentTime:
                                                                  DateTime
                                                                      .now(),
                                                              locale: LocaleType
                                                                  .en);
                                                    });
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
                                                      locale: LocaleType.en);
                                                },
                                              )),
                                        ])),

                                // SizedBox(height: 10),
                              ])))),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          highlightColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text("  "),
                        MaterialButton(
                          color: Colors.white,
                          highlightColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            final test = Test(
                                module: _module,
                                location: _location,
                                date: dateWithoutFormat,
                                time: timeWithoutFormat);
                            database.insertTest(test);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Done",
                            style: TextStyle(color: Color(teal_bg)),
                          ),
                        )
                      ],
                    ),
                  )
                ]));
      }));
}

viewExamDialog(BuildContext context, List modulesList, Test itemTest,
    AppDatabase database) {
  int teal_bg = 0xFF02aab0, label_clr = 0xFF4ED4D8;
  var _date = itemTest.date != null ? itemTest.date : "",
      _time = itemTest.time != null ? itemTest.time : "";
  String module = itemTest.module;
  var locationController = new TextEditingController();
  locationController.text = itemTest.location;

  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(teal_bg),
      child: StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 375,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Exam",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: module,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Color(teal_bg),
                    ),
                    iconSize: 30,
                    elevation: 0,
                    style: TextStyle(color: Color(teal_bg), fontSize: 20),
                    onChanged: (newValue) {
                      setState(() {
                        module = newValue;
                        database
                            .updateTest(itemTest.copyWith(module: newValue));
                      });
                    },
                    items: modulesList.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Venue",
                      style: TextStyle(fontSize: 18, color: Color(label_clr)),
                    ),
                    TextField(
                        controller: locationController,
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        decoration: InputDecoration(
                          hintText: "-",
                          hintStyle: TextStyle(color: Colors.white),
                          focusColor: Colors.white,
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          locationController.addListener(() {
                            database.updateTest(itemTest.copyWith(
                                location: locationController.text));
                          });
                        }),
                  ]),
              SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.schedule,
                              color: Color(teal_bg),
                              size: 16,
                            ),
                            SizedBox(width: 5),
                            Text(
                                _time.toString().isNotEmpty
                                    ? DateFormat("hh:mm a")
                                        .format(_time)
                                        .toString()
                                    : "-",
                                style: TextStyle(
                                    color: Color(teal_bg), fontSize: 16)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today,
                                color: Color(teal_bg), size: 16),
                            SizedBox(width: 5),
                            Text(
                                _date.toString().isNotEmpty
                                    ? DateFormat("EEE, dd MMM")
                                        .format(_date)
                                        .toString()
                                    : "-",
                                style: TextStyle(
                                    color: Color(teal_bg), fontSize: 16)),
                          ],
                        ),
                        ButtonTheme(
                            minWidth: 5,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Color(teal_bg),
                              ),
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2020, 1, 1),
                                    maxTime: DateTime(2050, 6, 7),
                                    onConfirm: (date_new) {
                                  setState(() {
                                    DatePicker.showTime12hPicker(context,
                                        showTitleActions: true,
                                        onConfirm: (time_new) {
                                      setState(() {
                                        database.updateTest(itemTest.copyWith(
                                            time: time_new, date: date_new));
                                        _time = time_new;
                                        _date = date_new;
                                      });
                                    }, locale: LocaleType.en);
                                  });
                                },
                                    currentTime:
                                        _date != "" ? _date : DateTime.now(),
                                    locale: LocaleType.en);
                              },
                            )),
                      ])),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: RawMaterialButton(
                      highlightColor: Colors.white,
                      fillColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        database.deleteTest(itemTest);
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.delete_outline,
                          color: Color(teal_bg), size: 25),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: RawMaterialButton(
                      highlightColor: Colors.white,
                      fillColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          color: Color(teal_bg), size: 25),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }));
}
