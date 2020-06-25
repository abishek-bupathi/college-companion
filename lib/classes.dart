import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import './calendar.dart';
import './user_details.dart';
import 'database.dart';

bool data_present = false;

List<String> daysOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
DateTime date = DateTime.now();
String current_day = DateFormat('EEE').format(date);

int index =
    daysOfWeek.indexOf(current_day) < 5 ? daysOfWeek.indexOf(current_day) : 0;

int _selectedPage = index;

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> with SingleTickerProviderStateMixin {
  int magenta_dark = 0xFF861657, magenta_light = 0xFFaf5a76;
  TabController _tabController;

  @override
  void initState() {
    print(daysOfWeek.indexOf(current_day));
    super.initState();
    _tabController =
        new TabController(vsync: this, length: 5, initialIndex: index);
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
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
            actions: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                margin: EdgeInsets.fromLTRB(0, 0,15, 0),
                height: 40,
                width: 40,
                child: new IconButton(
                  icon: new Icon(Icons.event),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return Calendar_dialog(database);
                      },
                    );
                  },
                  iconSize: 35,
                  color: Color(magenta_dark),
                ),
              ),
            ],
          ),
          body: StreamBuilder(
              stream: database.watchAllPeriods(),
              builder: (context, AsyncSnapshot<List<PeriodData>> snapshot) {
                final periods = snapshot.data ?? List();
                bool data_exists = periods.isNotEmpty;
                return data_exists
                    ? classes_body(context, setState, _tabController)
                    : empty_classes_body(setState, database);
              })),
    );
  }
}

empty_classes_body(StateSetter setState, AppDatabase database) {
  return Center(
    child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              size: 50,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Tap to add new Timetable",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        onTap: () {
          setState(() {
            List<DateTime> time = [
              DateTime.parse("2020-02-27 09:00:00"),
              DateTime.parse("2020-02-27 10:00:00"),
              DateTime.parse("2020-02-27 11:00:00"),
              DateTime.parse("2020-02-27 12:00:00"),
              DateTime.parse("2020-02-27 13:00:00"),
              DateTime.parse("2020-02-27 14:00:00"),
              DateTime.parse("2020-02-27 15:00:00"),
              DateTime.parse("2020-02-27 16:00:00"),
              DateTime.parse("2020-02-27 17:00:00")];
            for (int i = 0; i < 5; i++) for (int j = 0; j < 9; j++) {
              final period = PeriodData(
                     module: "",
                     location: "",
                     day: i,
                     lecturer: "",
                     time: time[j]
              );
              database.insertPeriod(period);
            }
          });
        }),
  );
}

classes_body(
    BuildContext context, StateSetter setState, TabController _tabController) {
  int magenta_dark = 0xFF861657, magenta_light = 0xFFaf5a76;

  double width = (MediaQuery.of(context).size.width - 50) / 3;

  final _pageOptions = [
    timeTable(width, 0),
    timeTable(width, 1),
    timeTable(width, 2),
    timeTable(width, 3),
    timeTable(width, 4),
  ];

  return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                  height: 45,
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
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: Expanded(
                  child: TabBarView(children: _pageOptions,
                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),),
                ),
              ),
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
              spreadRadius: 2.0, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                0, // vertical, move down 10
              ),
            )
          ],
        ),
        child: TabBar(
          controller: _tabController,
          // setting attributes for the bar
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            color: Color(magenta_light),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0, // has the effect of softening the shadow
                spreadRadius: 3.0, // has the effect of extending the shadow
                offset: Offset(
                  0, // horizontal, move right 10
                  0, // vertical, move down 10
                ),
              )
            ],
          ),

          onTap: (index) {
            setState(() {
              _tabController.animateTo(index);
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
  );
}

class timeTable extends StatefulWidget {
  // TODO: Read data from classes table
  double width;
  int day;

  List<String> modulesList = UserDetails().getModules();
  List<String> modules_mon = [
    "Maths",
    "-",
    "Analog",
    "Analog",
    "-",
    "Programming",
    "-",
    "Physics",
    "-"
  ];
  List<String> modules_tue = [
    "Physics",
    "Programming",
    "Electrical",
    "Analog",
    "-",
    "Maths",
    "Maths",
    "Digital",
    "-"
  ];
  List<String> locationList = [
    "ENG-3034",
    "ENG-3034",
    "ENG-3035",
    "ENG-2034",
    "G-07",
    "ENG-3034",
    "ENG-1004",
    "AC-002",
    "ENG-3034"
  ];
  List<String> timeList = [
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 AM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM"
  ];
  List<String> lecturers = [
    "Ron",
    "Ron",
    "Ron",
    "Ron",
    "Ron",
    "Ron",
    "Ron",
    "Ron",
    "Ron"
  ];

  timeTable(this.width, this.day);

  @override
  _timeTableState createState() => _timeTableState();
}

class _timeTableState extends State<timeTable> {
  List<String> modules;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    double height = MediaQuery.of(context).size.height - 278;

    return StreamBuilder(
      stream: database.watchTodayPeriod(widget.day),
      builder: (context,AsyncSnapshot<List<PeriodData>> snapshot) {
        final periods = snapshot.data ?? List();
        return Container(
            height: height,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, int index) {
                  final itemPeriod = periods[index];
                  return GestureDetector(
                    child: ItemClasses(database,itemPeriod, widget.width, height),
                    onTap: () {
                      if (itemPeriod.module != "") {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => viewClassDialog(
                                context,
                                widget.modulesList,
                                itemPeriod,
                                database));
                      } else {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) =>
                                addClassDialog(context,
                                    widget.modulesList,
                                    itemPeriod,
                                    database));
                      }
                    },
                  );
                },
                itemCount: periods.length));
      }
    );
  }
}

class ItemClasses extends StatefulWidget {
  double width, height;
  AppDatabase database;
  PeriodData itemPeriod;


  ItemClasses(this.database,this.itemPeriod, this.width, this.height);
  @override
  _ItemClassesState createState() => _ItemClassesState();
}

class _ItemClassesState extends State<ItemClasses> {
  @override
  Widget build(BuildContext context) {

    String venue = widget.itemPeriod.location,
           module = widget.itemPeriod.module;
    var  time = widget.itemPeriod.time != null ? widget.itemPeriod.time : "";

    int magenta_dark = 0xFF861657, magenta_light = 0xFFaf5a76;
    double item_height = 40;
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

            colors: [Color(magenta_light), Color(magenta_dark)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              child: Text(
                DateFormat("hh:mm a").format(time).toString(),
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
                module != ""? module : "-",
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
                venue != ""? venue : "-",
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

viewClassDialog(BuildContext context, List modulesList, PeriodData itemPeriod, AppDatabase database ) {
  int magenta_bg = 0xFF861657, label_clr = 0xFFE0A3C6;
  String _module = itemPeriod.module;
  var locationController = new TextEditingController();
  locationController.text = itemPeriod.location;
  var lecturerController = new TextEditingController();
  lecturerController.text = itemPeriod.lecturer;

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
                          hintText: "-",
                          hintStyle: TextStyle(color: Color(label_clr)),
                          focusColor: Colors.white,
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            locationController.addListener(() {
                              database.updatePeriod(
                                  itemPeriod.copyWith(location: locationController.text));
                            });
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
                          hintText: "-",
                          hintStyle: TextStyle(color: Color(label_clr)),
                          focusColor: Colors.white,
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            lecturerController.addListener(() {
                              database.updatePeriod(
                                  itemPeriod.copyWith(lecturer: lecturerController.text));
                            });
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
                child: modulesList.isEmpty
                    ? SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: Center(
                            child: Text(
                          "No modules found \n Please add modules in profile",
                          style: TextStyle(color: Color(magenta_bg)),
                          textAlign: TextAlign.center,
                        )))
                    : DropdownButtonHideUnderline(
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
                          style:
                              TextStyle(color: Color(magenta_bg), fontSize: 20),
                          onChanged: (newValue) {
                            setState(() {
                              _module = newValue;
                              database.updatePeriod(
                                itemPeriod.copyWith(module: newValue)
                              );
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
                      onPressed: () {
                        database.updatePeriod(itemPeriod.copyWith(
                          lecturer: "",
                          location: "",
                          module: "",
                        ));
                        Navigator.pop(context);
                      },
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
                        if(_module != null)
                        Navigator.pop(context);
                        else{
                          Toast.show(
                              "Module cannot be empty",
                              context,
                              duration: Toast.LENGTH_LONG,
                              backgroundRadius: 10);
                        }
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

addClassDialog(BuildContext context, List modulesList, PeriodData itemPeriod, AppDatabase database ) {
  String _location = "",
      _lecturer = "",
      _module = modulesList.isNotEmpty ? modulesList[0] : null;

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
                                  child: modulesList.isEmpty
                                      ? SizedBox(
                                          width: double.infinity,
                                          height: 45,
                                          child: Center(
                                              child: Text(
                                            "No modules found \n Please add modules in profile",
                                            style: TextStyle(
                                                color: Color(magenta_bg)),
                                            textAlign: TextAlign.center,
                                          )))
                                      : DropdownButtonHideUnderline(
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
                                                color: Color(magenta_bg),
                                                fontSize: 20),
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
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 12),
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
                          onPressed: () {
                            if(_module != null){
                            database.updatePeriod(itemPeriod.copyWith(
                                location: _location ,
                                lecturer: _lecturer,
                                module: _module
                            ));
                            Navigator.pop(context);
                            }else{
                              Toast.show(
                                  "Module cannot be empty",
                                  context,
                                  duration: Toast.LENGTH_LONG,
                                  backgroundRadius: 10);
                            }
                          },
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
