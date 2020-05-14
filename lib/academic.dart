import 'package:flutter/material.dart';

class Academic extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFffebe6), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
        )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Academic',
                style: TextStyle(fontSize: 50, color: Colors.red)),
          )
      ),
    );
  }
}
