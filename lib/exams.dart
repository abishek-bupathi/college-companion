import 'package:flutter/material.dart';

class Exams extends StatelessWidget{

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
            title: Text('Exams',
                style: TextStyle(fontSize: 50, color: Colors.green)),
          )
      ),
    );
  }
}