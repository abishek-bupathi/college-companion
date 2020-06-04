import 'package:flutter/material.dart';

class Classes extends StatefulWidget {
  @override
  _ClassesState createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  int orange_dark = 0xFFE97052;
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
            title: Text('Classes',
                style: TextStyle(fontSize: 50, color: Color(orange_dark))),
          )),
    );
  }
}
