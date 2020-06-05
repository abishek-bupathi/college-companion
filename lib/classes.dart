import 'package:flutter/material.dart';

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  int orange_dark = 0xFFE97052, orange_light = 0xFFFEB37B;
  int _selectedPage = 2;


  int index = 2;
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 50) / 3;

    final _pageOptions = [
      timeTable(width, "mon"),
      timeTable(width, "tue"),
      timeTable(width, "wed"),
      timeTable(width, "thu"),
      timeTable(width, "fri"),
    ];



    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Classes',
              style: TextStyle(fontSize: 50, color: Color(orange_dark))),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: DefaultTabController(
            length: 5,
            child: Scaffold(
              body: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                color: Colors.white,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Card(
                        color: Color(orange_dark),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        child: Container(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                width: width,
                                child: Text(
                                  "Time",
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
                      SizedBox(height: 10),
                      Container(child: _pageOptions[_selectedPage]),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color(orange_dark),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0, // has the effect of softening the shadow
                      spreadRadius:
                          2.0, // has the effect of extending the shadow
                      offset: Offset(
                        0, // horizontal, move right 10
                        0, // vertical, move down 10
                      ),
                    )
                  ],
                ),
                child: TabBar(
                  // setting attributes for the bar
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicator: BoxDecoration(
                    color: Color(orange_light),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius:
                            5.0, // has the effect of softening the shadow
                        spreadRadius:
                            3.0, // has the effect of extending the shadow
                        offset: Offset(
                          0, // horizontal, move right 10
                          0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),

                  onTap: (index) {
                    setState(() {
                      _selectedPage = index;
                    });
                  },

                  tabs: [
                    Tab(
                      text: 'MON',
                    ),
                    Tab(
                      text: 'TUE',
                    ),
                    Tab(
                      text: 'WED',
                    ),
                    Tab(
                      text: 'THU',
                    ),
                    Tab(
                      text: 'FRI',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class timeTable extends StatefulWidget {

  double width;
  String day;

  List<String> modules_mon = ["Maths","-","Analog","Analog","-","Programming","-","Physics","-"];
  List<String> modules_tue = ["Physics","Programming","Electrical","Analog","-","Maths","Maths","Digital","-"];
  List<String> locationList = ["ENG-3034","ENG-3034","ENG-3035","ENG-2034","G-07","ENG-3034","ENG-1004","AC-002","ENG-3034"];
  List<String> timeList = ["9:00 AM","10:00 AM","11:00 AM","12:00 AM","1:00 PM","2:00 PM","3:00 PM","4:00 PM","5:00 PM"];

  timeTable(this.width, this.day);



  @override
  _timeTableState createState() => _timeTableState();
}

class _timeTableState extends State<timeTable> {
  List<String> modules;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 300;
    if (widget.day.compareTo("tue") == 0)
    {
      modules = widget.modules_tue;
    }else modules = widget.modules_mon;
    return Container(
      height: height,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (_, int index) {
               return ItemClasses(modules[index], widget.timeList[index], widget.locationList[index], widget.width, height);
            },
            itemCount: 9));
  }
}

class ItemClasses extends StatefulWidget {
  double width, height;
  var time;
  String module, venue;

  ItemClasses(this.module, this.time, this.venue, this.width, this.height);
  @override
  _ItemClassesState createState() => _ItemClassesState();
}

class _ItemClassesState extends State<ItemClasses> {
  @override
  Widget build(BuildContext context) {
    double item_height = (widget.height- 180)/9;
    return new Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        height: item_height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            //   colors: [Color(0xFF04B46D), Color(0xFF119DA4)],

            colors: [Color(0xFFFEB47B), Color(0xFFFF7E5F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              child: Text(
                widget.time,
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              width: widget.width,
              height: 14,
            ),
            Container(color: Colors.white54, width: 2.5),
            SizedBox(
              width: widget.width,
              child: Text(
                widget.module,
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
                widget.venue,
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
