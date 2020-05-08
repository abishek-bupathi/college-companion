
import 'package:flutter/material.dart';
import './academic.dart';
import './activities.dart';
import './exams.dart';
import './classes.dart';
import './profile.dart';
import './custom_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return MyAppState();
    }
}

class MyAppState extends State<MyApp>{

  int _selectedPage = 2;
  final _pageOptions = [
    Exams(),
    Classes(),
    Academic(),
    Activities(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "College Companion",
        home: Scaffold(

          body: _pageOptions[_selectedPage], //selecting page
          bottomNavigationBar: BottomNavigationBar(
            // setting attributes for the bar
        //    backgroundColor: const Color(0xFF1a232d),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white38,
            showSelectedLabels: false,
            showUnselectedLabels: false,
        //    type: BottomNavigationBarType.fixed,

            currentIndex: _selectedPage,
            onTap: (int index){
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.test),
                  backgroundColor: Color(0xFF00a064),
                  title: Text('Exam'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.calendar),
                backgroundColor: Color(0xFF1cb096),
                title: Text('Classes'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.list),
                backgroundColor: Color(0xFFd2341b),
                title: Text('Academic'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.scout),
                backgroundColor: Color(0xFF0488e3),
                title: Text('Activities'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.man_avatar),
                backgroundColor: Color(0xFF9e1bd6),
                title: Text('Profile'),
              ),
            ],
          ),
      )
    );
  }
}

