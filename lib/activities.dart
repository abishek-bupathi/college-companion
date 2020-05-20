import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import './calendar.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  int color_blue = 0xFF0276CB;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xFFe6f2ff), Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Activities',
                style: TextStyle(fontSize: 50, color: Color(color_blue))),
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
                color: Color(color_blue),
              ),
              new IconButton(
                icon: new Icon(Icons.add),
                onPressed: () {
                  AddActivityDialog(context);
                },
                iconSize: 40,
                color: Color(color_blue),
              ),
            ],
          )),
    );
  }
}

AddActivityDialog(BuildContext context) {
  String _dateEvent = " - ", _timeEvent = " - ", _note = "", _title = "";
  var dateWithoutFormat, timeWithoutFormat;

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(0xFF3C9CE2),
          child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: 485,
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
                              color: Color(0xFFF0274C7),
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
                            "Activity",
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
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.schedule,
                                                    color: Color(0xFF3C9CE2),
                                                    size: 15,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(_timeEvent,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF3C9CE2),
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(Icons.calendar_today,
                                                      color: Color(0xFF3C9CE2),
                                                      size: 15),
                                                  SizedBox(width: 5),
                                                  Text(_dateEvent,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF3C9CE2),
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              ButtonTheme(
                                                  minWidth: 5,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: Color(0xFF3C9CE2),
                                                    ),
                                                    onPressed: () {
                                                      DatePicker.showDatePicker(
                                                          context,
                                                          showTitleActions:
                                                              true,
                                                          minTime: DateTime(
                                                              2020, 1, 1),
                                                          maxTime: DateTime(
                                                              2050, 6, 7),
                                                          onConfirm: (date) {
                                                        setState(() {
                                                          dateWithoutFormat =
                                                              date;
                                                          _dateEvent = DateFormat(
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
                                                              _timeEvent = DateFormat(
                                                                      "hh:mm a")
                                                                  .format(
                                                                      timeWithoutFormat);
                                                            });
                                                          },
                                                                  currentTime:
                                                                      DateTime
                                                                          .now(),
                                                                  locale:
                                                                      LocaleType
                                                                          .en);
                                                        });
                                                      },
                                                          currentTime:
                                                              DateTime.now(),
                                                          locale:
                                                              LocaleType.en);
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
                                style: TextStyle(color: Color(0xFF3C9CE2)),
                              ),
                            )
                          ],
                        ),
                      )
                    ]));
          }));
    },
  );
}
