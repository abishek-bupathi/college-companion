import 'package:flutter/material.dart';

class Classes extends StatelessWidget{

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/backgrounds/wallpaper2.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Classes', style: TextStyle(fontSize: 50,color: Colors.white)),
          )

      ),

    );
  }

}