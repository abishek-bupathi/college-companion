import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './user_details.dart';
import './main.dart';

Welcome(BuildContext context) {
  int color_orange = 0xFFFD8369;
  return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Welcome',
            style: TextStyle(fontSize: 50, color: Color(color_orange))),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset("assets/backgrounds/welcome_bg.png"),
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  "This is a good app",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Color(color_orange), fontSize: 20),
                )),
            Container(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width - 40,
                child: RawMaterialButton(
                  highlightColor: Color(color_orange),
                  fillColor: Color(color_orange),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalDetails()));
                  },
                  child: Text(
                    "Get Started",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ));
}

class PersonalDetails extends StatefulWidget {
  String name = "", dob = "";
  String current_avatar = "assets/Avatars/0.png";
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final scaffold_key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    int selected;
    int color_grey = 0xFF3F3D56;
    double scrn_height = MediaQuery.of(context).size.height;
    double reducable_height =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom;

    return Scaffold(
      key: scaffold_key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Color(0xFFF2F2F2),
        title: Text('Details',
            style: TextStyle(fontSize: 50, color: Color(color_grey))),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            height: scrn_height - reducable_height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                (scrn_height < 750) ? Container(): Image.asset("assets/backgrounds/details_bg.png"),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration: BoxDecoration(
                      color: Color(color_grey),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Choose your Avatar",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                          margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(2, 0, 2, 2),
                            height: 135,
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: GridView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                    itemCount: 10,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 5,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 5),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      String grid_avatar = "assets/Avatars/" +
                                          index.toString() +
                                          ".png";
                                      selected =
                                          widget.current_avatar == grid_avatar
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
                                                    ? Color(color_grey)
                                                    : Colors.white,
                                                width: 2.5),
                                            // color: selected == index ? Colors.black26 : Colors.white
                                          ),
                                          height: 12,
                                          width: 12,
                                          child: GestureDetector(
                                            child: Image(
                                              image: AssetImage(grid_avatar),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                widget.current_avatar =
                                                    grid_avatar;
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
                  height: 55,
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: TextField(
                      cursorColor: Color(color_grey),
                      style: TextStyle(color: Color(color_grey), fontSize: 20),
                      decoration: InputDecoration(
                        labelText: 'Name',
                        focusColor: Color(color_grey),
                        labelStyle: new TextStyle(
                            color: Color(color_grey), fontSize: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(color_grey), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(color_grey), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (String name_new) {
                        setState(() {
                          widget.name = name_new;
                        });
                      }),
                ),
                Container(
                  height: 55,
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: TextField(
                      cursorColor: Color(color_grey),
                      style: TextStyle(color: Color(color_grey), fontSize: 20),
                      decoration: InputDecoration(
                        labelText: 'Date of Birth (dd/mm/yyyy)',
                        focusColor: Color(color_grey),
                        labelStyle: new TextStyle(
                            color: Color(color_grey), fontSize: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(color_grey), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(color_grey), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (String dob_new) {
                        setState(() {
                          widget.dob = dob_new;
                        });
                      }),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Hero(
                        child: SizedBox(
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
                              if(widget.dob == "" || widget.name == ""){
                                scaffold_key.currentState.showSnackBar(new SnackBar(
                                  content: new Text("Please fill all the details"),
                                 ));
                              }else{
                                UserDetails().setCurrentAvatar(widget.current_avatar);
                                UserDetails().setName(widget.name);
                                UserDetails().setDob(widget.dob);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UniversityDetails()));
                              }
                            },
                            child: Icon(Icons.arrow_forward_ios,
                                color: Colors.white, size: 25),
                          ),
                        ),
                        tag: "1",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UniversityDetails extends StatefulWidget {
  String course = "", university = "", id = "";

  @override
  _UniversityDetailsState createState() => _UniversityDetailsState();
}

class _UniversityDetailsState extends State<UniversityDetails> {
  final scaffold_key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    int color_grey = 0xFF3F3D56;
    double scrn_height = MediaQuery.of(context).size.height;
    double height =
        AppBar().preferredSize.height + MediaQuery.of(context).padding.top;

    return Scaffold(
      key: scaffold_key,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: Color(0xFF3F3D56),
          title: Text('Details',
              style: TextStyle(fontSize: 50, color: Colors.white)),
        ),
        body: Container(
            //padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            color: Colors.white,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height - height,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      (scrn_height < 750) ? Container(): Image.asset("assets/backgrounds/uni_details_bg.png"),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: TextField(
                            cursorColor: Color(color_grey),
                            style: TextStyle(
                                color: Color(color_grey), fontSize: 20),
                            decoration: InputDecoration(
                              labelText: 'ID',
                              focusColor: Color(color_grey),
                              labelStyle: new TextStyle(
                                  color: Color(color_grey), fontSize: 20),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_grey), width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_grey), width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onChanged: (String id_new) {
                              setState(() {
                                widget.id = id_new;
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
                              labelText: 'Course',
                              focusColor: Color(color_grey),
                              labelStyle: new TextStyle(
                                  color: Color(color_grey), fontSize: 20),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_grey), width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_grey), width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onChanged: (String course_new) {
                              setState(() {
                                widget.course = course_new;
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
                              labelText: 'University',
                              focusColor: Color(color_grey),
                              labelStyle: new TextStyle(
                                  color: Color(color_grey), fontSize: 20),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_grey), width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(color_grey), width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            onChanged: (String uni_new) {
                              setState(() {
                                widget.university = uni_new;
                              });
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Hero(
                              child: SizedBox(
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
                                    if(widget.university == "" || widget.course == "" || widget.id == ""){
                                      scaffold_key.currentState.showSnackBar(new SnackBar(
                                        content: new Text("Please fill all the details"),
                                      ));
                                    }else{

                                      UserDetails().setId(widget.id);
                                      UserDetails().setCourse(widget.course);
                                      UserDetails().setUniversity(widget.university);

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyApp()));
                                  }},
                                  child: Icon(Icons.check,
                                      color: Colors.white, size: 25),
                                ),
                              ),
                              tag: "1",
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            )));
  }
}
