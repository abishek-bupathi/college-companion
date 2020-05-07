
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

          body: _pageOptions[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(

            backgroundColor: const Color(0xFF1a232d),
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xFF6a7076),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,

            currentIndex: _selectedPage,
            onTap: (int index){
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.test),
                  title: Text('Exam'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.calendar),
                title: Text('Classes'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.list),
                title: Text('Academic'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.scout),
                title: Text('Activities'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.man_avatar),
                title: Text('Profile'),
              ),
            ],
          ),
      )
    );
  }
}

