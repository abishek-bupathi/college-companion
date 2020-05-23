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
  List<String> titleList = ["Badminton", "Photography", "Swimming", "Quiz", "Community work"];
  List<String> locationList = ["Kingfisher", "Bailey Allen","Kingfisher3","ENG-3004","Art and Science Building"];
  List<String> timeList = ["9:00 AM", "9:00 PM", "11:00 AM", "5:00 PM", "10:00 AM"];
  List<String> dateList = ["Mon, 23 Feb", "Fri, 28 Feb", "Sat, 21 Feb", "Wed, 24 Feb", "Thu, 25 Feb"];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.white/*Color(0xFFe6f2ff)*/, Colors.white],
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
                  addActivityDialog(context);
                },
                iconSize: 40,
                color: Color(color_blue),
              ),
            ],
          ),
      body: new Container(
      padding: EdgeInsets.all(5),
      child: new ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, int index) => ItemActivity(titleList[index], locationList[index], timeList[index], dateList[index]),
        itemCount: titleList.length,
      ),
     ),
      ),
    );
  }
}

addActivityDialog(BuildContext context) {
  String _dateEvent = " - ", _timeEvent = " - ", _note = "", _title = "";
  var dateWithoutFormat, timeWithoutFormat;
  int blue_bg = 0xFF3C9CE2, blue_high = 0xFFF0274C7;

  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(blue_bg),
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
                              color: Color(blue_high),
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
                                                              Color(blue_bg),
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Icon(Icons.calendar_today,
                                                      color: Color(blue_bg),
                                                      size: 15),
                                                  SizedBox(width: 5),
                                                  Text(_dateEvent,
                                                      style: TextStyle(
                                                          color:
                                                              Color(blue_bg),
                                                          fontSize: 15)),
                                                ],
                                              ),
                                              ButtonTheme(
                                                  minWidth: 5,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: Color(blue_bg),
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
                                style: TextStyle(color: Color(blue_bg)),
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

class ItemActivity extends StatefulWidget {

  String title, note;
  var time, date;

  ItemActivity(this.title, this.note, this.time, this.date);

  @override
  _ItemActivityState createState() => _ItemActivityState();
}

class _ItemActivityState extends State<ItemActivity> {
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
              colors: [Color(0xFF79C6FF),Color(0xFF0173C7)],
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
                  Text(widget.time ,style: TextStyle(color: Colors.white, fontSize: 16),),
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