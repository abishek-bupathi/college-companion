import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Calendar_dialog extends StatefulWidget {
  @override
  _Calendar_dialogState createState() => _Calendar_dialogState();
}

class _Calendar_dialogState extends State<Calendar_dialog> {

  List _selectedEvents;
  DateTime _selectedDay;
  final Map<DateTime, List> _events = {
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
  };

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }


  @override
  Widget build(BuildContext context) {

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
        height: 550,
                child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Calendar(
                  startOnMonday: true,
            weekDays: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
            events: _events,
            onRangeSelected: (range) =>
                print("Range is ${range.from}, ${range.to}"),
            onDateSelected: (date) => _handleNewDate(date),
            isExpanded: true,
            isExpandable: true,
            hideTodayIcon: true,
            eventDoneColor: Colors.green,
            selectedColor: Colors.black,
            todayColor: Colors.red,
            eventColor: Colors.grey,
            dayOfWeekStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 11),
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
                child: Icon(Icons.close,
                color: Colors.white, size: 25),
    ),
    ),]),
              )
              ],
          ),

    );


  }
  void _handleNewDate(date) {
    setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          height: 45,
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                ),

                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(_selectedEvents[index]['name'].toString(), style: TextStyle(fontSize: 20, color: Colors.white),)))),


        itemCount: _selectedEvents.length,
      ),
    );
  }

}
