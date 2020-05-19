import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import './calendar.dart';

class Academic extends StatefulWidget {
  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xFFffebe6), Colors.white],
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
                  AddTaskDialog(context);
                },
                iconSize: 40,
                color: Colors.red,
              ),
            ],
          ),
          body: ListItems(),
        ));
  }
}

AddTaskDialog(BuildContext context) {
  String _module = 'Maths', _date = "Not set", _note = "", _title = "";
  var dateWithoutFormat;

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(0xFFFF6E5E),
          child: StatefulBuilder(// You need this, notice the parameters below:
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 500,
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
                            color: Color(0xFFFF403E),
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
                                        color: Colors.white, fontSize: 25),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      labelStyle: new TextStyle(
                                          color: Colors.white, fontSize: 18),
                                      labelText: 'Title',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFFFACA9)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    onSubmitted: (String title) {
                                      setState(() {
                                        _title = title;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  TextField(
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                    decoration: InputDecoration(
                                      labelText: 'Note',
                                      focusColor: Colors.white,
                                      labelStyle: new TextStyle(
                                          color: Colors.white, fontSize: 18),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFFFACA9)),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    onSubmitted: (String note) {
                                      setState(() {
                                        _note = note;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Due",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(_date,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25)),
                                            ButtonTheme(
                                                minWidth: 5,
                                                child: FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  onPressed: () {
                                                    DatePicker.showDatePicker(
                                                        context,
                                                        showTitleActions: true,
                                                        minTime: DateTime(
                                                            2020, 1, 1),
                                                        maxTime: DateTime(
                                                            2025, 6, 7),
                                                        onConfirm: (date) {
                                                      setState(() {
                                                        dateWithoutFormat =
                                                            date;
                                                        _date = DateFormat(
                                                                "dd MMM, yyyy")
                                                            .format(
                                                                dateWithoutFormat);
                                                      });
                                                    },
                                                        currentTime:
                                                            DateTime.now(),
                                                        locale: LocaleType.en);
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                  ),
                                                  color: Colors.transparent,
                                                )),
                                          ]),
                                      Divider(
                                        color: Colors.white,
                                      )
                                    ],
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
                                          color: Color(0XFFFF6D5D),
                                        ),
                                        iconSize: 30,
                                        elevation: 0,
                                        style: TextStyle(
                                            color: Color(0XFFFF6D5D),
                                            fontSize: 25),
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
                              style: TextStyle(color: Color(0xFFFF6E5E)),
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

ListItems() {
  return Container(
    child: Text("List is here !"),
  );
}
