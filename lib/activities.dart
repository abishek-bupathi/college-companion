import 'package:flutter/material.dart';
import './calendar.dart';

class Activities extends StatelessWidget {
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

  AddActivityDialog(BuildContext context) {
    String date_time = '9:00 Am Wed 15, Mar';

    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Color(0xFF3C9CE2),
            child: Container(
                height: 525,
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
                                          color: Colors.white, fontSize: 25),
                                      decoration: InputDecoration(
                                        focusColor: Colors.white,
                                        labelStyle: new TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        labelText: 'Title',
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF89CDFF)),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
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
                                              color: Color(0xFF89CDFF)),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                      decoration: InputDecoration(
                                        labelText: 'Location',
                                        focusColor: Colors.white,
                                        labelStyle: new TextStyle(
                                            color: Colors.white, fontSize: 18),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF89CDFF)),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Date and Time",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: 3),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(date_time,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25)),
                                              Icon(
                                                Icons.edit,
                                                color: Colors.white,
                                              ),
                                            ]),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Divider(
                                          thickness: 0.75,
                                          color: Color(0xFF89CDFF),
                                        )
                                      ],
                                    ),
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
                              onPressed: () {},
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
                    ])));
      },
    );
  }
}
