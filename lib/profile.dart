import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget{

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String id = "18280072", name = "Abishek Bupathi", course = "Electronic and Computer";
  List<String> modules = ["Maths", "Programming", "Electrical", "Mechanics"];
  List<String> skills = ["Julia","C","Raspberry Pi", "Java", "Python", "Badminton"];
  int light_purple = 0xFFF39CE2,dark_purple = 0xFF8E00B9;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
             colors: [Colors.white/*Color(0xFFf2e6ff)*/, Colors.white],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
          )
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.account_box, size: 150,color: Color(dark_purple),),
                    IconButton(
                      icon: Icon(Icons.edit, color: Color(dark_purple),size: 30,),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                    Container(
                      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(5, 5), // changes position of shadow
                            ),
                          ],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                           colors: [Color(light_purple),Color(dark_purple)],
                           begin: Alignment.topLeft,
                           end: Alignment.bottomRight
                         )
                      ),
                      child: Text(id,style: TextStyle(color: Colors.white, fontSize: 20),)
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 15,
                                offset: Offset(5, 5), // changes position of shadow
                              ),
                            ],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [Color(light_purple),Color(dark_purple)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                            )
                        ),
                        child: Text(name,style: TextStyle(color: Colors.white, fontSize: 20),)
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [Color(light_purple),Color(dark_purple)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                            ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(5, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(course,style: TextStyle(color: Colors.white, fontSize: 20),)
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 150,
                        padding: EdgeInsets.fromLTRB(12, 0, 0,8),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [Color(light_purple),Color(dark_purple)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                            ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(5, 5), // changes position of shadow
                            ),
                          ],

                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: <Widget>[
                               Text("Modules", style: TextStyle(color: Colors.white, fontSize: 25),),
                               IconButton(
                                 icon: Icon(Icons.edit, color: Colors.white,),
                               )
                             ],
                           ),

                           Expanded(
                             child: GridView.builder(
                               padding: EdgeInsets.fromLTRB(0, 4, 12, 0),
                               scrollDirection: Axis.vertical,
                              itemCount: modules.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                              childAspectRatio: 3.25,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  alignment: Alignment.center,
            //                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white
                                  ),
                                  padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(modules[index], style: TextStyle(color: Color(dark_purple), fontSize: 15),))
                                );
                              },
                            ),
                           ),



                          ])),
                    SizedBox(height: 20),
                    Container(
                        height: 150,
                        padding: EdgeInsets.fromLTRB(12, 0, 0,8),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [Color(light_purple),Color(dark_purple)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight
                            ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 15,
                              offset: Offset(5, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Skills", style: TextStyle(color: Colors.white, fontSize: 25),),
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.white,),
                                  )
                                ],
                              ),

                              Expanded(
                                child: GridView.builder(
                                  padding: EdgeInsets.fromLTRB(0, 4, 12, 0),
                                  scrollDirection: Axis.vertical,
                                  itemCount: skills.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 3.25,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                        alignment: Alignment.center,
                                        //                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                        ),
                                        padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(skills[index], style: TextStyle(color: Color(dark_purple), fontSize: 15),))
                                    );
                                  },
                                ),
                              ),



                            ])),

                  ],
                ),
                )],
            )

          ),
      ),
    );
  }
}