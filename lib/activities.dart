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
  List<String> noteList = ["Bring Raquet", "Make Collage", "Don't forget goggles", "General Knowledge qns", "Bring food"];
  List<String> locationList = ["Kingfisher", "Bailey Allen","Kingfisher3","ENG-3004","Art and Science Building"];
  List<String> timeList = ["9:00 AM", "9:00 PM", "11:00 AM", "5:00 PM", "10:00 AM"];
  List<String> dateList = ["Mon, 23 Feb", "Fri, 28 Feb", "Sat, 21 Feb", "Wed, 24 Feb", "Thu, 25 Feb"];

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
          padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
          child: new ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, int index) {
                return GestureDetector(
                    child:  ItemActivity(titleList[index], locationList[index], timeList[index], dateList[index], completed),
                    onTap: () => editActivityDialog(context,titleList[index], noteList[index], locationList[index], dateList[index], timeList[index])
                );
              },

              itemCount: titleList.length,
           ),
        ),
      ),
    );
  }
}

class ItemActivity extends StatefulWidget {

  String title, note, location;
  var time, date;
  bool completed = false;

  ItemActivity(this.title, this.location, this.time, this.date, this.completed);

 // var check_icon = completed ? Icons.check_circle : Icons.radio_button_unchecked;

  @override
  _ItemActivityState createState() => _ItemActivityState();
}

class _ItemActivityState extends State<ItemActivity> {

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
          height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.completed ? [Colors.black54,Colors.black54]:[Color(0xFF79C6FF),Color(0xFF0173C7)],
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
                    icon: Icon(widget.completed ? Icons.check_circle : Icons.radio_button_unchecked, color: Colors.white,),
                    onPressed: (){
                      setState(() {
                        if(widget.completed) {
                          widget.completed = false;
                        }else
                         widget.completed = true;
                      });
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.title ,style: TextStyle(color: Colors.white, fontSize: 25),),
                      Text(widget.location,style: TextStyle(color: Colors.white, fontSize: 15),)
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
      elevation: 5,
      //    shadowColor: Colors.red,
      margin: EdgeInsets.all(10),

    );
  }
}

addActivityDialog(BuildContext context) {
  String _dateEvent = " - ", _timeEvent = " - ", _note = "", _title = "";
  var dateWithoutFormat, timeWithoutFormat;
  int blue_bg = 0xFF3C9CE2, blue_high = 0xFFF0274C7;
  var scrollController = new ScrollController();
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
                            controller: scrollController,
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
                                      onTap: (){
                                        scrollController.jumpTo(2);
                                      },
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

editActivityDialog(BuildContext context, String title, String note, String location, var _date , var _time) {

  int blue_bg = 0xFF3C9CE2, label_clr = 0xFF89CDFF;
  var dateWithoutFormat, timeWithoutFormat;
  var noteController = new TextEditingController();
  noteController.text = note;
  var titleController = new TextEditingController();
  titleController.text = title;
  var locationController = new TextEditingController();
  locationController.text = location;
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(blue_bg),
          child: StatefulBuilder(// You need this, notice the parameters below:
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                    padding: EdgeInsets.fromLTRB(20,10,20,20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        TextField(
                            controller: titleController,
                            cursorColor: Colors.white,
                            style: TextStyle(
                                color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.white),
                              ),
                            ),
                            onSubmitted: (String title_new) {
                              setState(() {
                                title =title_new;
                              });
                            }
                        ),

                        SizedBox(height: 15),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Note", style: TextStyle(fontSize: 18, color: Color(label_clr)),),
                              TextField(
                                  controller: noteController,
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,

                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onSubmitted: (String note_new) {
                                    setState(() {
                                      note = note_new;
                                    });
                                  }
                              ),
                            ]
                        ),


                        SizedBox(height: 20,),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Location", style: TextStyle(fontSize: 18, color: Color(label_clr)),),
                              TextField(
                                  controller: locationController,
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                  decoration: InputDecoration(
                                    focusColor: Colors.white,

                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onSubmitted: (String location_new) {
                                    setState(() {
                                      location = location_new;
                                    });
                                  }
                              ),
                            ]
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
                                      Text(_time,
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
                                      Text(_date,
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
                                                  _date = DateFormat(
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
                                                          _time = DateFormat(
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
                                child: Icon(Icons.delete_outline,color: Color(blue_bg),size: 25),
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
                                child: Icon(Icons.arrow_back_ios,color: Color(blue_bg),size: 25),
                              ),
                            ),

                          ],
                        )

                      ],

                    ));
              }));
    },
  );
}