
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
      return MyAppState();
    }
}

class MyAppState extends State<MyApp>{

  int _selectedPage = 2;
  var _pageController = PageController(initialPage: 2);

  final _pageOptions = [
    Exams(),
    Classes(),
    Academic(),
    Activities(),
    Profile(),
  ];

  int index = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "College Companion",
        home: Scaffold(

          body: PageView(
            children: _pageOptions,
            onPageChanged: (index){
              setState(() {
                _selectedPage = index;
              });
            },
            controller: _pageController,
          ),

          bottomNavigationBar: BottomNavigationBar(
            // setting attributes for the bar
            unselectedItemColor: Colors.black38,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,

            currentIndex: _selectedPage,
            onTap: (index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            },

            items: [
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.test),
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  CustomIcons.test,
                  color: Color(0xFF00a064),
                  size: 25,
                ),
                title: Text('Exam'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.calendar),
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  CustomIcons.calendar, color: Color(0xFFff8000), size: 25,),
                title: Text('Classes'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.list),
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  CustomIcons.list, color: Color(0xFFd2341b), size: 25,),
                title: Text('Academic'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.scout),
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  CustomIcons.scout, color: Color(0xFF0488e3), size: 25,),
                title: Text('Activities'),
              ),
              BottomNavigationBarItem(
                icon: Icon(CustomIcons.man_avatar),
                backgroundColor: Colors.white,
                activeIcon: Icon(
                  CustomIcons.man_avatar, color: Color(0xFF9e1bd6), size: 25,),
                title: Text('Profile'),
              ),
            ],
          ),
      )
    );
  }
}

