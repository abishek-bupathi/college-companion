import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import './calendar.dart';
import './user_details.dart';

bool data_exists = false;

class Academic extends StatefulWidget {
  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  List<String> moduleList = UserDetails().getModules();

  List<String> titleList = [
    "Assignment 1",
    "Assignment 3",
    "Assignment 4",
    "Class Test",
    "Assignment 2"
  ];
  List<String> noteList = [
    "Based on Lecture 2",
    "Based on Lecture 10",
    "Based on Lecture 2 and 3",
    "Study all concepts",
    "Based on Lecture 4 and 5"
  ];

  List<String> dateList = [
    "Mon, 23 Feb",
    "Fri, 28 Feb",
    "Sat, 21 Feb",
    "Wed, 24 Feb",
    "Thu, 25 Feb"
  ];
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.light,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Academic',
                style: TextStyle(
                    fontSize: 50,
                    color: Color(0xFFc71831),
                    fontWeight: FontWeight.bold)),
            actions: <Widget>[
              new IconButton(
                icon: new Icon(Icons.event),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => Calendar_dialog(),
                  );
                },
                iconSize: 40,
                color: Color(0xFFc71831)
              ),
              new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () {
            showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) =>  addTaskDialog(context, moduleList));
                },
                iconSize: 40,
                color: Color(0xFFc71831)
              ),
            ],
          ),
          body: !data_exists ?
            Center(
              child: Text("No Tasks Pending !", style: TextStyle(fontSize: 20,color: Colors.grey),),
            )
          : new Container(
            padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: new ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, int index) {
                return GestureDetector(
                  child: ItemAcademic(titleList[index], noteList[index],
                      moduleList[index], dateList[index], completed),
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => editTaskDialog(
                              context,
                              titleList[index],
                              noteList[index],
                              moduleList[index],
                              dateList[index],
                              moduleList
                            )).then((_) => setState(() {}));
                  },
                );
              },
              itemCount: titleList.length,
            ),
          ),
        ));
  }
}

addTaskDialog(BuildContext context, List modulesList) {
  String _module, _note = "", _title = "";
  var dateWithoutFormat, _date = " - ";
  int red_bg = 0xFFe1323b, red_high = 0xFFb6152b;

  if(modulesList.isNotEmpty)
  _module= modulesList[0];

  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(red_bg),
      child: StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 470,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(red_high),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      child: Hero(
                        tag: "Add",
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                    Text(
                      "Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
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
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(children: <Widget>[
                              TextField(
                                cursorColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  labelStyle: new TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  labelText: 'Title',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (String title) {
                                  setState(() {
                                    _title = title;
                                  });
                                },
                                onSubmitted: (String title) {
                                  setState(() {
                                    _title = title;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              TextField(
                                cursorColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  labelText: 'Note',
                                  focusColor: Colors.white,
                                  labelStyle: new TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (String note) {
                                  setState(() {
                                    _note = note;
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
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        color: Color(red_bg),
                                        size: 20,
                                      ),
                                      Text("   " + _date,
                                          style: TextStyle(
                                              color: Color(red_bg),
                                              fontSize: 20)),
                                      ButtonTheme(
                                          minWidth: 0,
                                          child: IconButton(
                                            focusColor: Colors.black12,
                                            highlightColor: Colors.transparent,
                                            iconSize: 20,
                                            icon: Icon(
                                              Icons.edit,
                                              color: Color(red_bg),
                                            ),
                                            onPressed: () {
                                              DatePicker.showDatePicker(context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(2020, 1, 1),
                                                  maxTime: DateTime(2025, 6, 7),
                                                  onConfirm: (date) {
                                                setState(() {
                                                  dateWithoutFormat = date;
                                                  _date = DateFormat(
                                                          "EEE, dd MMM")
                                                      .format(
                                                          dateWithoutFormat);
                                                });
                                              },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.en);
                                            },
                                          )),
                                    ]),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: modulesList.isEmpty?
                                SizedBox(
                                  width: double.infinity,
                                    height: 45,
                                    child: Center(child: Text("No modules found \n Please add modules in profile", style: TextStyle(color: Color(red_bg)),textAlign: TextAlign.center,)))
                                    : DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                    isExpanded: true,
                                    value: _module,
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Color(red_bg),
                                    ),
                                    iconSize: 30,
                                    elevation: 0,
                                    style: TextStyle(
                                        color: Color(red_bg), fontSize: 20),
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
                            ])))),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        highlightColor: Color(red_high),
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
                          style: TextStyle(color: Color(red_bg)),
                        ),
                      )
                    ],
                  ),
                )
              ]),
        );
      }));
}

class ItemAcademic extends StatefulWidget {
  String title, note, module, date;
  bool completed = false;

  ItemAcademic(this.title, this.note, this.module, this.date, this.completed);

  @override
  _ItemAcademicState createState() => _ItemAcademicState();
}

class _ItemAcademicState extends State<ItemAcademic> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
          height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.completed
                  ? [Colors.black54, Colors.black54]
                  : [Color(0xFFf45033), Color(0xFFc71831)],

              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      widget.completed
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (widget.completed) {
                          widget.completed = false;
                        } else
                          widget.completed = true;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        widget.note,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.module,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              )
            ],
          )),
      elevation: 5,
      //    shadowColor: Colors.red,
      margin: EdgeInsets.all(10),
    );
  }
}

editTaskDialog(BuildContext context, String title, String note, String module, var date, List modulesList) {
  int red_bg = 0xFFe1323b, red_high = 0xFFb6152b, label_clr = 0xFFFFACA9;
  var dateWithoutFormat;
  var noteController = new TextEditingController();
  noteController.text = note;
  var titleController = new TextEditingController();
  titleController.text = title;

  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(red_bg),
      child: StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
        return Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: titleController,
                    cursorColor: Colors.white,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      enabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  onTap: (){
                    titleController.addListener((){
                      title = titleController.text;
                    });
                  },),
                SizedBox(height: 15),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Note",
                        style: TextStyle(fontSize: 18, color: Color(label_clr)),
                      ),
                      TextField(
                        cursorColor: Colors.white,
                          controller: noteController,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        onTap: (){
                          noteController.addListener((){
                            note = noteController.text;
                          });
                        },),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Color(red_bg),
                          size: 20,
                        ),
                        Text("   " + date,
                            style:
                                TextStyle(color: Color(red_bg), fontSize: 20)),
                        ButtonTheme(
                            minWidth: 0,
                            child: IconButton(
                              focusColor: Colors.black12,
                              highlightColor: Colors.transparent,
                              iconSize: 20,
                              icon: Icon(
                                Icons.edit,
                                color: Color(red_bg),
                              ),
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2020, 1, 1),
                                    maxTime: DateTime(2025, 6, 7),
                                    onConfirm: (date1) {
                                  setState(() {
                                    dateWithoutFormat = date1;
                                    date = DateFormat("EEE, dd MMM")
                                        .format(dateWithoutFormat);
                                  });
                                },
                                    currentTime: DateTime.now(),
                                    locale: LocaleType.en);
                              },
                            )),
                      ]),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: modulesList.isEmpty?
                      Text("No modules found")
                      : DropdownButtonHideUnderline(
                    child: DropdownButton(
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      value: module,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Color(red_bg),
                      ),
                      iconSize: 30,
                      elevation: 0,
                      style: TextStyle(color: Color(red_bg), fontSize: 20),
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
                            color: Color(red_high), size: 25),
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
                            color: Color(red_high), size: 25),
                      ),
                    ),
                  ],
                )
              ],
            ));
      })
  );
}
