import 'package:college_companion/database.dart';
import 'package:college_companion/user_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar_dialog extends StatefulWidget {
  AppDatabase database;
  var _events = <DateTime, List>{}, _holidays = <DateTime, List>{};


  Calendar_dialog(this.database);

  @override
  _Calendar_dialogState createState() => _Calendar_dialogState();
}

class _Calendar_dialogState extends State<Calendar_dialog> {
  List _selectedEvents;
  CalendarController _calendarController;
  int ctr = 0;

  @override
  void initState() {
    super.initState();
    _selectedEvents = widget._events[DateTime.now()] ?? [];
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    eventsData(widget.database).then((value) => {
          if (this.mounted && ctr == 0)
            {
              setState(() {
                widget._events = value;
                ctr++;
              }),
            }
        });

    print(widget._events);

    for(int i = UserDetails().getDob().year; i < UserDetails().getDob().year + 50; i++)
      {
        widget._holidays.addAll({DateTime(i,UserDetails().getDob().month, UserDetails().getDob().day): ["Happy Birthday !"]});
      }

  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: TableCalendar(
              events: widget._events,
              holidays: widget._holidays,
              initialCalendarFormat: CalendarFormat.month,
              initialSelectedDay: DateTime.now(),

              calendarStyle: CalendarStyle(
                markersColor: Colors.grey,
                todayColor: Colors.orangeAccent,
                selectedColor: Colors.black,
                todayStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              headerStyle: HeaderStyle(
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, _) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    margin: const EdgeInsets.all(4.0),
                    padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                    width: 100,
                    height: 100,
                    child: Text(
                      '${date.day}',
                      style: TextStyle()
                          .copyWith(fontSize: 16.0, color: Colors.white),
                    ),
                  );
                },
                todayDayBuilder: (context, date, _) {
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black12,
                    ),
                    margin: const EdgeInsets.all(4.0),
                    padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                    width: 100,
                    height: 100,
                    child: Text(
                      '${date.day}',
                      style: TextStyle().copyWith(fontSize: 16.0),
                    ),
                  );
                },
                markersBuilder: (context, date, events, holidays) {
                  final children = <Widget>[];

                  if (events.isNotEmpty) {
                    children.add(
                      Positioned(
                        right: 1,
                        bottom: 1,
                        child: _buildEventsMarker(date, events),
                      ),
                    );
                  }

                  if (holidays.isNotEmpty) {
                    children.add(
                      Positioned(
                        right: -1,
                        top: -1,
                        child: _buildHolidaysMarker(),
                      ),
                    );
                  }

                  return children;
                },
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarController: _calendarController,
              onDaySelected: (date, events) {
                setState(() {
                  print(date.toIso8601String());
                  _selectedEvents = events;
                });
              },
            ),
          ),
          _buildEventList(),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: RawMaterialButton(
                      highlightColor: Colors.black87,
                      fillColor: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.white, size: 25),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.cake,
      size: 20.0,
      color: Colors.deepOrange,
    );
  }

  Widget _buildEventList() {
    return _selectedEvents.length != 0
        ? Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) => Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                        child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              _selectedEvents[index]['name'].toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )))),
                itemCount: _selectedEvents.length,
              ),
            ),
          )
        : Container(
            height: 10,
          );
  }

  Future<Map<DateTime, List>> eventsData(AppDatabase database) async {
    Map events = Map<DateTime, List>();

    database.watchAllTests();
    database.watchAllActivities();
    database.watchAllTask();
    List data = [];
    List<Task> tasks = await database.getAllTasks() ?? List();
    List<Test> tests = await database.getAllTests() ?? List();
    List<ActivityData> activities = await database.getAllActivities() ?? List();
    List<DateTime> dates = [];
    // print(dates.indexOf(tasks[0].dueDate));

    await Future.forEach(tasks, (task) {
      if (dates.indexOf(task.dueDate) == -1 && task.dueDate != null) {
        dates.add(task.dueDate);
      }
    });
    await Future.forEach(tests, (test) {
      if (dates.indexOf(test.date) == -1 && test.date != null) {
        dates.add(test.date);
      }
    });
    await Future.forEach(activities, (activity) {
      if (dates.indexOf(activity.date) == -1 && activity.date != null) {
        dates.add(activity.date);
      }
    });

    await Future.forEach(dates, (date) async {
      List<Task> task_titles = await database.getTaskOnDate(date) ?? List();
      List<Test> tests_titles = await database.getTestOnDate(date) ?? List();
      List<ActivityData> activity_titles =
          await database.getActivityOnDate(date) ?? List();
      print(task_titles);
      Future.forEach(task_titles, (element) {
        data.add({
          'name': element.module + " " + element.title,
          'isDone': element.completed
        });
      });
      Future.forEach(tests_titles, (element) {
        data.add({'name': element.module + " Exam", 'isDone': false});
      });
      Future.forEach(activity_titles, (element) {
        data.add({'name': element.title, 'isDone': element.completed});
      });

      events.putIfAbsent(date, () => data);

      data = [];
    });

    return events;
  }
}

/*
{
      DateTime(2020, 5, 7): [
        {'name': 'Event A', 'isDone': true},
      ],
      DateTime(2020, 5, 9): [
        {'name': 'Event A', 'isDone': true},
        {'name': 'Event B', 'isDone': true},
      ],
      DateTime(2020, 5, 10): [
        {'name': 'Event A', 'isDone': true},
        {'name': 'Event B', 'isDone': true},
      ],
      DateTime(2020, 5, 13): [
        {'name': 'Event A', 'isDone': true},
        {'name': 'Event B', 'isDone': true},
        {'name': 'Event C', 'isDone': false},
      ],
      DateTime(2020, 5, 25): [
        {'name': 'Event A', 'isDone': true},
        {'name': 'Event B', 'isDone': true},
        {'name': 'Event C', 'isDone': false},
      ],
      DateTime(2020, 6, 6): [
        {'name': 'Event A', 'isDone': false},
      ],
    }
 */
