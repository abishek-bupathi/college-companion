import 'package:flutter/material.dart';
import './user_details.dart';

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  int magenta_dark = 0xFF861657, magenta_light = 0xFFaf5a76;
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
              style: TextStyle(fontSize: 50, color: Color(magenta_dark))),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                        color: Color(magenta_dark),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        child: Container(
                          height: (MediaQuery.of(context).size.height-425)/10,
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
                  color: Color(magenta_dark),
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
                    color: Color(magenta_light),
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
  List<String> modulesList = UserDetails().modules;
  List<String> modules_mon = ["Maths","-","Analog","Analog","-","Programming","-","Physics","-"];
  List<String> modules_tue = ["Physics","Programming","Electrical","Analog","-","Maths","Maths","Digital","-"];
  List<String> locationList = ["ENG-3034","ENG-3034","ENG-3035","ENG-2034","G-07","ENG-3034","ENG-1004","AC-002","ENG-3034"];
  List<String> timeList = ["9:00 AM","10:00 AM","11:00 AM","12:00 AM","1:00 PM","2:00 PM","3:00 PM","4:00 PM","5:00 PM"];
  List<String> lecturers = ["Ron", "Ron", "Ron", "Ron", "Ron", "Ron", "Ron", "Ron", "Ron"];

  timeTable(this.width, this.day);

  @override
  _timeTableState createState() => _timeTableState();
}

class _timeTableState extends State<timeTable> {
  List<String> modules;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 305;
    if (widget.day.compareTo("tue") == 0)
    {
      modules = widget.modules_tue;
    }else modules = widget.modules_mon;
    return Container(
      height: height,
        child: ListView.builder(

            physics: BouncingScrollPhysics(),
            itemBuilder: (_, int index) {
            return  GestureDetector(
                child: ItemClasses(modules[index], widget.timeList[index], widget.locationList[index], widget.width, height),
                onTap: () {
                  if(modules[index] != '-'){
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => viewClassDialog(
                          context,
                          modules[index],
                          widget.modulesList,
                          widget.locationList[index],
                          widget.lecturers[index]
                    ));}
                  else{
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => addClassDialog(
                            context,
                            widget.modulesList
                        ));
                  }
                },
              );
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

            colors: [Color(_ClassesState().magenta_light), Color(_ClassesState().magenta_dark)],
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

viewClassDialog(BuildContext context, String module,List modulesList, String location, String lecturer) {
  int magenta_bg = 0xFF861657, label_clr = 0xFFE0A3C6;
  var dateWithoutFormat, timeWithoutFormat;

  var locationController = new TextEditingController();
  locationController.text = location;
  var lecturerController = new TextEditingController();
  lecturerController.text = lecturer;

  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(magenta_bg),
      child: StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 400,

              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Class",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25),
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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Lecturer/ Tutor",
                          style: TextStyle(fontSize: 18, color: Color(label_clr)),
                        ),
                        TextField(
                            controller: lecturerController,
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
                            onChanged: (String lecturer_new) {
                              setState(() {
                                lecturer = lecturer_new;
                              });
                            }),
                      ]),
                  SizedBox(height: 20),
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
                          color: Color(magenta_bg),
                        ),
                        iconSize: 30,
                        elevation: 0,
                        style: TextStyle(color: Color(magenta_bg), fontSize: 20),
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
                    height: 30,
                  ),
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
                              color: Color(magenta_bg), size: 25),
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
                              color: Color(magenta_bg), size: 25),
                        ),
                      ),
                    ],
                  )
                ],

              ),
            );
          }));
}

addClassDialog(BuildContext context, List modulesList) {
  String _location = "",
         _lecturer = "",
         _module = modulesList[0];

  int magenta_bg = 0xFF861657, magenta_dark = 0xFF530030;
  var scrollController = new ScrollController();
  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(magenta_bg),
      child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
                height: 390,
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
                              color: Color(magenta_dark),
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
                            "Class",
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
                                            color: Color(magenta_bg),
                                          ),
                                          iconSize: 30,
                                          elevation: 0,
                                          style: TextStyle(
                                              color: Color(magenta_bg), fontSize: 20),
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
                                    TextField(
                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      decoration: InputDecoration(
                                        labelText: 'Lecturer/Tutor',
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
                                      onChanged: (String new_lecturer) {
                                        setState(() {
                                          _lecturer = new_lecturer;
                                        });
                                      },
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
                                style: TextStyle(color: Color(magenta_bg)),
                              ),
                            )
                          ],
                        ),
                      )
                    ]));
          }));
}
