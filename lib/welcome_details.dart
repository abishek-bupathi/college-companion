import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './user_details.dart';

class PersonalDetails extends StatefulWidget {
  String name = "", dob = "";
  String current_avatar = UserDetails().current_avatar;
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    int selected;
    int color_grey = 0xFF3F3D56;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Details',
            style: TextStyle(fontSize: 50, color: Color(color_grey))),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Image.asset("assets/backgrounds/details_bg.png"),
            Container(
              margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
                decoration: BoxDecoration(
                    color: Color(color_grey),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: Text("Choose your Avatar", style: TextStyle(fontSize: 20, color: Colors.white),textAlign: TextAlign.left,),
                        margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
                      ),
                Container(
                  margin: EdgeInsets.fromLTRB(2, 0, 2, 2),
                    height: 150,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),

                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      color: Colors.white,
                    ),
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
                                mainAxisSpacing: 10
                            ),
                              itemBuilder: (BuildContext context, int index) {
                               String grid_avatar = "assets/Avatars/" +
                                  index.toString() +
                                  ".png";
                              selected = widget.current_avatar == grid_avatar
                                  ? index
                                  : null;
                              return Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: selected == index
                                            ? Color(color_grey)
                                            : Colors.white,
                                        width: 2.5
                                    ),
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
                                        widget.current_avatar = grid_avatar;
                                        selected = index;
                                      });
                                    },
                                  ));
                            },
                          ),
                        ),
                      ],
                    )),
            ]),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextField(
                  cursorColor: Color(color_grey),
                  style: TextStyle(
                      color: Color(color_grey), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    focusColor: Color(color_grey),
                    labelStyle: new TextStyle(
                        color: Color(color_grey), fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(color_grey), width: 2),
                        borderRadius:
                        BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(color_grey), width: 2),
                        borderRadius:
                        BorderRadius.circular(10)),
                  ),
                  onSubmitted: (String name_new) {
                    setState(() {
                      widget.name = name_new;
                    });
                  }),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: TextField(
                  cursorColor: Color(color_grey),
                  style: TextStyle(
                      color: Color(color_grey), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    focusColor: Color(color_grey),
                    labelStyle: new TextStyle(
                        color: Color(color_grey), fontSize: 20),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(color_grey), width: 2),
                        borderRadius:
                        BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(color_grey), width: 2),
                        borderRadius:
                        BorderRadius.circular(10)),
                  ),
                  onSubmitted: (String dob_new) {
                    setState(() {
                      widget.dob = dob_new;
                    });
                  }),

            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: RawMaterialButton(
                      highlightColor: Color(color_grey),
                      fillColor: Color(color_grey),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {},
                      child: Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 25),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: RawMaterialButton(
                      highlightColor: Color(color_grey),
                      fillColor: Color(color_grey),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_forward_ios,
                          color: Colors.white, size: 25),
                    ),
                  ),
                ],
              ),
            )],
        ),
      ),
    );
  }
}
