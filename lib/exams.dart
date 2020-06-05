import 'package:flutter/material.dart';
import './user_details.dart';
import './calendar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';


class Exams extends StatefulWidget{

  @override
  _ExamsState createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  @override
  Widget build(BuildContext context) {
    int teal_dark = 0xFF05989B;
    List<String> examList = UserDetails().modules;
    List<String> moduleList = UserDetails().modules;
    List<String> locationList = ["Kingfisher","Kingfisher","Kingfisher","Kingfisher","Kingfisher","Kingfisher"];
    List<String> dateList = ["Mon, 24 Feb","Tue, 25 Feb","Wed, 26 Feb","Thu, 27 Feb","Fri, 28 Feb","Mon, 1 Mar"];
    List<String> timeList = ["9:00 AM","9:00 AM","9:00 AM","9:00 AM","9:00 AM","9:00 AM"];

    double width = (MediaQuery.of(context).size.width - 50)/3 ;
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
                    builder: (BuildContext context) => Calendar(),
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
                      builder: (context) =>  addExamDialog(context,moduleList));
                },
                iconSize: 40,
                color: Color(teal_dark),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[

                Card(
                    color: Color(teal_dark),
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10), ),
                    elevation: 5,
                    child: Container(
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                           SizedBox(
                             width: width,
                             child: Text("Date & Time", style: TextStyle(color: Colors.white, fontSize: 18,),textAlign: TextAlign.center,),
                           ),
                          Container(color: Colors.white54, width: 2.5,),
                          SizedBox(
                            width: width,
                            child: Text("Module", style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,),
                          ),
                          Container(color: Colors.white54, width: 2.5,),
                          SizedBox(
                            width: width,
                            child: Text("Venue", style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,),
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
                        return GestureDetector(
                          child: ItemExam(examList[index], timeList[index], dateList[index], locationList[index], width),
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => viewExamDialog(
                                    context,
                                  moduleList[index],
                                  moduleList,
                                  locationList[index],
                                  dateList[index],
                                  timeList[index]

                                ));
                          },
                        );
                      },
                      itemCount: examList.length,
                    ),
                  ),
                )

              ],
      ),
      ),
      ),
    );
  }
}

class ItemExam extends StatefulWidget {
  String module, venue;
  var date, time;
  double width;

  ItemExam(this.module, this.time, this.date, this.venue, this.width);

  @override
  _ItemExamState createState() => _ItemExamState();
}

class _ItemExamState extends State<ItemExam> {
  @override
  Widget build(BuildContext context) {
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
                      child: Text(widget.time,style: TextStyle(color: Colors.white,fontSize: 15), textAlign: TextAlign.center,),
                      width: widget.width,
                      height: 14,
                    ),
                    Container(color: Colors.white54, height: 2.5),
                    SizedBox(
                      child: Text(widget.date, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                      width: widget.width,
                      height: 14,
                    ),

            ],),
            width: widget.width,
            ),
            Container(color: Colors.white54, width: 2.5),
            SizedBox(
              width: widget.width,
              child: Text(widget.module, style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
            ),
            Container(color: Colors.white54, width: 2.5,),
            SizedBox(
              width: widget.width,
              child: Text(widget.venue, style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}

addExamDialog(BuildContext context, List modulesList) {
  String _dateExam = " - ",
      _timeExam = " - ",
      _location = "",
      _module = modulesList[0];
  var dateWithoutFormat, timeWithoutFormat;
  int teal_bg = 0xFF02aab0, teal_dark = 0xFF05989B;
  var scrollController = new ScrollController();
  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(teal_bg),
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: 392,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                                      child: DropdownButtonHideUnderline(
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
                                              color: Color(teal_bg), fontSize: 20),
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
                                        labelText: 'Location',
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
                        padding: EdgeInsets.all(15),
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
                              onPressed: () {},
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

viewExamDialog(BuildContext context, String module,List modulesList, String location, var _date, var _time) {
  int teal_bg = 0xFF02aab0, label_clr = 0xFF4ED4D8, teal_dark = 0xFF05989B;
  var dateWithoutFormat, timeWithoutFormat;

  var locationController = new TextEditingController();
  locationController.text = location;

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
                                  "Location",
                                  style: TextStyle(fontSize: 18, color: Color(label_clr)),
                                ),
                                TextField(
                                    controller: locationController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(color: Colors.white, fontSize: 25),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    onChanged: (String location_new) {
                                      setState(() {
                                        location = location_new;
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
                                        Text(_time,
                                            style: TextStyle(
                                                color: Color(teal_bg), fontSize: 16)),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.calendar_today,
                                            color: Color(teal_bg), size: 16),
                                        SizedBox(width: 5),
                                        Text(_date,
                                            style: TextStyle(
                                                color: Color(teal_bg), fontSize:16)),
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
                                                onConfirm: (date) {
                                                  setState(() {
                                                    dateWithoutFormat = date;
                                                    _date = DateFormat(
                                                        "EEE, dd MMM")
                                                        .format(
                                                        dateWithoutFormat);

                                                    DatePicker.showTime12hPicker(context,
                                                        showTitleActions: true,
                                                        onConfirm: (time) {
                                                          setState(() {
                                                            timeWithoutFormat = time;
                                                            _time = DateFormat("hh:mm a")
                                                                .format(timeWithoutFormat);
                                                          });
                                                        },
                                                        currentTime: DateTime.now(),
                                                        locale: LocaleType.en);
                                                  });
                                                },
                                                currentTime: DateTime.now(),
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
                                  onPressed: () {},
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

