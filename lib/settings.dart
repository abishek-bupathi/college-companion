import 'package:college_companion/custom_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import './user_details.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int dark_grey = 0xFF252733, light_grey = 0xFF373A4B;
  int selected;
  String edited_name;
  String id = UserDetails().getId(),
      name = UserDetails().getName(),
      course = UserDetails().getCourse(),
      dob = UserDetails().getDob(),
      current_avatar = UserDetails().getCurrentAvatar();

  @override
  Widget build(BuildContext context) {
    var nameController = new TextEditingController();
    nameController.text = name;
    var idController = new TextEditingController();
    idController.text = id;
    var courseController = new TextEditingController();
    courseController.text = course;
    var scrollController = new ScrollController();

    return Container(
      color: Colors.white,
      child: WillPopScope(
        onWillPop: () {
          if(course != "" || name != "" || id != ""){
          UserDetails().setCourse(course);
          UserDetails().setName(name);
          UserDetails().setId(id);
          UserDetails().setCurrentAvatar(current_avatar);
          Navigator.pop(context);
    }else{
    Toast.show("No field should be empty",
    context,
    duration: Toast.LENGTH_LONG,
    backgroundRadius: 10);
    }
          return null;
        },

        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.light,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Settings',
                style: TextStyle(fontSize: 50, color: Color(dark_grey))),
            actions: <Widget>[
              new IconButton(
                icon: Hero(
                  child: new Icon(Icons.close),
                  tag: "setting",
                ),
                onPressed: () {
                  if(course != "" || name != "" || id != ""){
                  UserDetails().setCourse(course);
                  UserDetails().setName(name);
                  UserDetails().setId(id);
                  UserDetails().setCurrentAvatar(current_avatar);
                  Navigator.pop(context);
                  }else{
                    Toast.show("No field should be empty",
                        context,
                        duration: Toast.LENGTH_LONG,
                        backgroundRadius: 10);
                  }
                },
                iconSize: 40,
                color: Color(dark_grey),
              ),
            ],
          ),
          body: Container(
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
              Card(
                margin: EdgeInsets.all(15),
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Container(
                    height: 470,
                    decoration: BoxDecoration(
                        color: Color(dark_grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 10),
                            Icon(CustomIcons.man_avatar, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              "Edit Profile",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                            height: 150,
                            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            color: Color(light_grey),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GridView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    itemCount: 10,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 10),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String grid_avatar = "assets/Avatars/" +
                                          index.toString() +
                                          ".png";
                                      selected = current_avatar == grid_avatar
                                          ? index
                                          : null;
                                      return Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: selected == index
                                                    ? Color(dark_grey)
                                                    : Color(light_grey),
                                                width: 2.5),
                                            // color: selected == index ? Colors.black26 : Colors.white
                                          ),
                                          height: 15,
                                          width: 15,
                                          child: GestureDetector(
                                            child: Image(
                                              image: AssetImage(grid_avatar),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                current_avatar = grid_avatar;
                                                selected = index;
                                              });
                                            },
                                          ));
                                    },
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Container(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                                child: Column(children: [
                                  TextField(
                                    controller: nameController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      focusColor: Colors.white,
                                      labelStyle: new TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onTap: () {
                                      nameController.addListener(() {
                                        name = nameController.text;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  TextField(
                                    controller: idController,
                                    cursorColor: Colors.white,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    decoration: InputDecoration(
                                      labelText: 'Id',
                                      focusColor: Colors.white,
                                      labelStyle: new TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    onTap: () {
                                      idController.addListener(() {
                                        id = idController.text;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  TextField(
                                      controller: courseController,
                                      cursorColor: Colors.white,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                      decoration: InputDecoration(
                                        labelText: 'Course',
                                        focusColor: Colors.white,
                                        labelStyle: new TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      onTap: () {
                                        courseController.addListener(
                                          () {
                                            course = courseController.text;
                                            scrollController.jumpTo(1);
                                          },
                                        );
                                      })
                                ])),
                          ),
                        ),
                      ],
                    )),
              ),
              Card(
                margin: EdgeInsets.all(15),
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Color(light_grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            color: Color(dark_grey),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(width: 10),
                              Icon(Icons.info_outline, color: Colors.white),
                              SizedBox(width: 10),
                              Text(
                                "About",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Color(light_grey),
                        )
                      ],
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
