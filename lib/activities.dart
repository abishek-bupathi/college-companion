import 'package:flutter/material.dart';

class Activities extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xFFe6f2ff), Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Activities',
                style: TextStyle(fontSize: 50, color: Colors.blue)),
          )),
    );
  }

}