import 'package:flutter/material.dart';

class Activities extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/backgrounds/wallpaper5.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Activities', style: TextStyle(fontSize: 50,color: Colors.white)),
          )

      ),

    );
  }

}