import 'package:flutter/material.dart';
import './main.dart';

class Exams extends StatefulWidget{

  @override
  _ExamsState createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  @override
  Widget build(BuildContext context) {
    int orange_dark = 0xFFFF9B38;
    List<String> examList = MyApp().modules;
    double width = (MediaQuery.of(context).size.width - 50)/3 ;
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.light,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Exams',
                style: TextStyle(fontSize: 50, color: Color(orange_dark))),
          ),
          body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[

                Card(
                    color: Color(orange_dark),
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10), ),
                    elevation: 5,
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                           SizedBox(
                             width: width,
                             child: Text("Date & Time", style: TextStyle(color: Colors.white, fontSize: 18,),textAlign: TextAlign.center,),
                           ),
                          Container(color: Colors.white54, width: 2.5,),
                          SizedBox(
                            width: width,
                            child: Text("Module", style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,),
                          ),
                          Container(color: Colors.white54, width: 2.5,),
                          SizedBox(
                            width: width,
                            child: Text("Venue", style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,),
                          ),

                        ],
                      ),
                    ),
                  ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: new ListView.builder(
                      physics: BouncingScrollPhysics(),

                      itemBuilder: (_, int index) {
                        return GestureDetector(
                          child: ItemExam(examList[index], "9:00 AM", "Mon 25, Feb", "Kingfisher", width),
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => editExamDialog(
                                    context,
                                ));
                          },
                        );
                      },
                      itemCount: examList.length,
                    ),
                  ),
                )

              ],
      ),
      ),
      ),
    );
  }
}

class ItemExam extends StatefulWidget {
  String module, venue;
  var date, time;
  double width;

  ItemExam(this.module, this.time, this.date, this.venue, this.width);

  @override
  _ItemExamState createState() => _ItemExamState();
}

class _ItemExamState extends State<ItemExam> {
  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Color(0xFFFFE157), Color(0xFFFFA851)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      child: Text(widget.time,style: TextStyle(color: Colors.white,fontSize: 15), textAlign: TextAlign.center,),
                      width: widget.width,
                      height: 14,
                    ),
                    Container(color: Colors.white54, height: 2.5),
                    SizedBox(
                      child: Text(widget.date, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                      width: widget.width,
                      height: 14,
                    ),

            ],),
            width: widget.width,
            ),
            Container(color: Colors.white54, width: 2.5),
            SizedBox(
              width: widget.width,
              child: Text(widget.module, style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
            ),
            Container(color: Colors.white54, width: 2.5,),
            SizedBox(
              width: widget.width,
              child: Text(widget.venue, style: TextStyle(color: Colors.white, fontSize: 18),textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}

editExamDialog(BuildContext context){

}