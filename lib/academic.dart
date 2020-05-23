import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import './calendar.dart';

class Academic extends StatefulWidget {
  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  List<String> titleList = ["Assignment 1", "Assignment 3", "Assignment 4", "Class Test", "Assignment 2"];
  List<String> noteList = ["Based on Lecture 2", "Based on Lecture 10","Based on Lecture 2 and 3","Study all concepts","Based on Lecture 4 and 5"];
  List<String> moduleList = ["Maths", "Programming", "Analog Devices", "Microprocessor", "Electrical"];
  List<String> dateList = ["Mon, 23 Feb", "Fri, 28 Feb", "Sat, 21 Feb", "Wed, 24 Feb", "Thu, 25 Feb"];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white/*Color(0xFFffebe6)*/, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Academic',
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
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
                color: Colors.red,
              ),
              new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () {
                  addTaskDialog(context);
                },
                iconSize: 40,
                color: Colors.red,
              ),
            ],
          ),
          body:  new Container(
            padding: EdgeInsets.all(5),
            child: new ListView.builder(
              physics: BouncingScrollPhysics(),
                itemBuilder: (_, int index) => ItemAcademic(titleList[index], noteList[index], moduleList[index], dateList[index]),
              itemCount: titleList.length,
            ),
          ),
        ));
  }
}

addTaskDialog(BuildContext context) {
  String _module = 'Maths',_note = "", _title = "";
  var dateWithoutFormat,  _date = " - ";
  int red_bg = 0xFFFF6659, red_high = 0xFFEC4343;

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onSubmitted: (String note) {
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
                                                highlightColor:
                                                    Colors.transparent,
                                                iconSize: 20,
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Color(red_bg),
                                                ),
                                                onPressed: () {
                                                  DatePicker.showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime:
                                                          DateTime(2020, 1, 1),
                                                      maxTime:
                                                          DateTime(2025, 6, 7),
                                                      onConfirm: (date) {
                                                    setState(() {
                                                      dateWithoutFormat = date;
                                                      _date = DateFormat(
                                                              "EEE, dd MMM")
                                                          .format(
                                                              dateWithoutFormat);
                                                    });
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
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
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        dropdownColor: Colors.white,
                                        isExpanded: true,
                                        value: _module,
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xFFFF5B51),
                                        ),
                                        iconSize: 30,
                                        elevation: 0,
                                        style: TextStyle(
                                            color: Color(red_bg),
                                            fontSize: 20),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            _module = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Maths',
                                          'Programming',
                                          'Electrical',
                                          'Microprocessor'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
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
                              style: TextStyle(color: Color(red_bg)),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            );
          }));
    },
  );
}


class ItemAcademic extends StatefulWidget {

  String title, note, module, date;

  ItemAcademic(this.title, this.note, this.module, this.date);

  @override
  _ItemAcademicState createState() => _ItemAcademicState();
}

class _ItemAcademicState extends State<ItemAcademic> {
  var check_icon = Icons.radio_button_unchecked;
  int ctr = 0;
  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
        height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFff9d7e),Color(0xFFff403d)],
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
                    icon: Icon(check_icon, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        if(ctr%2 == 0) {
                          check_icon = Icons.check_circle;
                        }else
                          check_icon = Icons.radio_button_unchecked;
                          ctr++;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.title ,style: TextStyle(color: Colors.white, fontSize: 25),),
                      Text(widget.note,style: TextStyle(color: Colors.white, fontSize: 15),)
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.module ,style: TextStyle(color: Colors.white, fontSize: 16),),
                  Text(widget.date,style: TextStyle(color: Colors.white, fontSize: 16),)
                ],
              )
            ],
          )
      ),
      elevation: 8,
  //    shadowColor: Colors.red,
      margin: EdgeInsets.all(10),

    );
  }
}
