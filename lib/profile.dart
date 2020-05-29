import 'package:college_companion/custom_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String id = "18280072",
      name = "Abishek Bupathi",
      course = "Electronic and Computer";
  List<String> modules = ["Maths", "Programming", "Electrical", "Mechanics"];
  List<String> skills = [
    "Julia",
    "C",
    "Raspberry Pi",
    "Java",
    "Python",
    "Badminton"
  ];
  int light_purple = 0xFFF39CE2, dark_purple = 0xFF8E00B9;
  String current_avatar = "assets/Avatars/4.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.white /*Color(0xFFf2e6ff)*/, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            padding: EdgeInsets.fromLTRB(20, 50, 0, 20),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 105,
                      height: 105,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      decoration: BoxDecoration(
                        //  borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(current_avatar),
                            fit: BoxFit.cover),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        CustomIcons.edit,
                        color: Color(dark_purple),
                        size: 25,
                      ),
                      onPressed: () {
                        editProfileDialog(context, setState, name, id, course,
                            current_avatar);
                      },
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(light_purple),
                                    Color(dark_purple)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          child: Text(
                            id,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      SizedBox(height: 20),
                      Container(
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(light_purple),
                                    Color(dark_purple)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight)),
                          child: Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      SizedBox(height: 20),
                      Container(
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color(light_purple),
                                  Color(dark_purple)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Text(
                            course,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      SizedBox(height: 20),
                      Container(
                          height: 150,
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color(light_purple),
                                  Color(dark_purple)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Modules",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    IconButton(
                                      icon: Icon(CustomIcons.edit,
                                          color: Colors.white, size: 20),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: GridView.builder(
                                    padding: EdgeInsets.fromLTRB(0, 4, 12, 0),
                                    scrollDirection: Axis.vertical,
                                    itemCount: modules.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 3.25,
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                          alignment: Alignment.center,
                                          //                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            /*    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 15,
                                        offset: Offset(5, 5), // changes position of shadow
                                      ),
                                    ],*/
                                          ),
                                          padding:
                                              EdgeInsets.fromLTRB(3, 3, 3, 3),
                                          child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                modules[index],
                                                style: TextStyle(
                                                    color: Color(dark_purple),
                                                    fontSize: 15),
                                              )));
                                    },
                                  ),
                                ),
                              ])),
                      SizedBox(height: 20),
                      Container(
                          height: 150,
                          padding: EdgeInsets.fromLTRB(12, 0, 0, 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color(light_purple),
                                  Color(dark_purple)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Skills",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                    IconButton(
                                      icon: Icon(CustomIcons.edit,
                                          color: Colors.white, size: 20),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: GridView.builder(
                                    padding: EdgeInsets.fromLTRB(0, 4, 12, 0),
                                    scrollDirection: Axis.vertical,
                                    itemCount: skills.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 3.25,
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                          alignment: Alignment.center,
                                          //                margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                          ),
                                          padding:
                                              EdgeInsets.fromLTRB(3, 3, 3, 3),
                                          child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                skills[index],
                                                style: TextStyle(
                                                    color: Color(dark_purple),
                                                    fontSize: 15),
                                              )));
                                    },
                                  ),
                                ),
                              ])),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

editProfileDialog(BuildContext context, StateSetter setState, String name,
    String id, String course, String current_avatar) {
  int purple_bg = 0xFFA21FC2;
  int selected;
  var nameController = new TextEditingController();
  nameController.text = name;
  var idController = new TextEditingController();
  idController.text = id;
  var courseController = new TextEditingController();
  courseController.text = course;
  var scrollController = new ScrollController();

  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Color(purple_bg),
            child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 480,
                child: Column(
                  children: <Widget>[
                    Container(
                        height: 150,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 105,
                              height: 105,
                              margin: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                //  borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(current_avatar),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                itemCount: 6,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 15,
                                        mainAxisSpacing: 15),
                                itemBuilder: (BuildContext context, int index) {
                                  String grid_avatar = "assets/Avatars/" + index.toString() + ".png";
                                  selected = current_avatar == grid_avatar ? index : null;
                                  return Container(
                                    padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: selected == index ? Color(purple_bg) : Colors.white , width: 2),
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
                                  onSubmitted: (String name_new) {
                                    setState(() {
                                      name = name_new;
                                    });
                                  }),
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

                                  onSubmitted: (String id_new) {
                                    setState(() {
                                      id = id_new;
                                    });
                                  }),
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
                                  onTap: (){
                                    scrollController.jumpTo(1);
                                  },
                                  onSubmitted: (String course_new) {
                                    setState(() {
                                      course = course_new;
                                    });
                                  }),
                            ])),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            highlightColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text("  "),
                          MaterialButton(
                            color: Colors.white,
                            highlightColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Done",
                              style: TextStyle(color: Color(purple_bg)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
      });
}
