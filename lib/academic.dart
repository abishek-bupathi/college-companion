import 'package:college_companion/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import './database.dart';
import './calendar.dart';
import './user_details.dart';

class Academic extends StatefulWidget {
  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  List<String> moduleList = UserDetails().getModules();

  List<String> titleList = [
    "Assignment 1",
    "Assignment 3",
    "Assignment 4",
    "Class Test",
    "Assignment 2"
  ];
  List<String> noteList = [
    "Based on Lecture 2",
    "Based on Lecture 10",
    "Based on Lecture 2 and 3",
    "Study all concepts",
    "Based on Lecture 4 and 5"
  ];

  List<String> dateList = [
    "Mon, 23 Feb",
    "Fri, 28 Feb",
    "Sat, 21 Feb",
    "Wed, 24 Feb",
    "Thu, 25 Feb"
  ];
  bool completed;

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    final scaffold_key = new GlobalKey<ScaffoldState>();

    return Container(
        color: Colors.white,
        child: Scaffold(
          key: scaffold_key,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            brightness: Brightness.light,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text('Academic',
                style: TextStyle(
                    fontSize: 50,
                    color: Color(0xFFc71831),
                    fontWeight: FontWeight.bold)),
            actions: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                height: 40,
                width: 40,
                child: new IconButton(
                    icon: new Icon(Icons.event),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Calendar_dialog(database);
                        }
                        );
                    },
                    iconSize: 35,
                    color: Color(0xFFc71831)),
              ),
              SizedBox(width: 10,),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0,15, 0),
                padding: EdgeInsets.fromLTRB(0, 0,0, 0),
                height:45,
                width: 45,
                child: new IconButton(
                    icon: new Icon(Icons.add),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => addTaskDialog(
                              context, moduleList, database, scaffold_key));
                    },
                    iconSize: 45,
                    color: Color(0xFFc71831)),
              ),
            ],
          ),
          body: StreamBuilder(
              stream: database.watchAllTask(),
              builder: (context, AsyncSnapshot<List<Task>> snapshot) {
                final tasks = snapshot.data ?? List();
                bool data_exists = tasks.isEmpty;
                return data_exists
                    ? Center(
                        child: Text(
                          "No Tasks Pending !",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      )
                    : new Container(
                        padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
                        child: new ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (_, int index) {
                            final itemTask = tasks[index];
                            return GestureDetector(
                              child: ItemAcademic(itemTask, database),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => editTaskDialog(
                                        context,
                                        itemTask,
                                        moduleList,
                                        database)).then((_) => setState(() {}));
                              },
                            );
                          },
                          itemCount: tasks.length,
                        ),
                      );
              }),
        ));
  }
}

class ItemAcademic extends StatefulWidget {
  Task itemTask;
  AppDatabase database;
  ItemAcademic(this.itemTask, this.database);

  @override
  _ItemAcademicState createState() => _ItemAcademicState();
}

class _ItemAcademicState extends State<ItemAcademic> {
  @override
  Widget build(BuildContext context) {
    bool completed = widget.itemTask.completed;
    String title = widget.itemTask.title,
        note = widget.itemTask.note,
        module = widget.itemTask.module;
    var date = widget.itemTask.dueDate != null ? widget.itemTask.dueDate : "";
    print(date);
    return new Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 15, 10),
          height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: completed
                  ? [Colors.black54, Colors.black54]
                  : [Color(0xFFf45033), Color(0xFFc71831)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      completed
                          ? Icons.check_circle
                          : Icons.radio_button_unchecked,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        if (completed) {
                          widget.database.updateTask(
                              widget.itemTask.copyWith(completed: false));
                          completed = false;
                        } else {
                          widget.database.updateTask(
                              widget.itemTask.copyWith(completed: true));
                          completed = true;
                        }
                      });
                    },
                  ),
                  Container(
                    width: 200,
                    child: note != ""
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                title,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 25),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                note,
                                style:
                                    TextStyle(color: Colors.white70, fontSize: 15),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )
                        : Text(
                            title,
                            style: TextStyle(color: Colors.white, fontSize: 28),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                          ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    module,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        date.toString().isEmpty
                            ? "-"
                            : DateFormat("EEE, dd MMM").format(date).toString(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(width: 5,),
                      Icon(Icons.event, size: 18,color: Colors.white,),
                    ],
                  )
                ],
              )
            ],
          )),
      elevation: 5,
      //    shadowColor: Colors.red,
      margin: EdgeInsets.all(10),
    );
  }
}

addTaskDialog(BuildContext context, List modulesList, AppDatabase database,
    GlobalKey<ScaffoldState> scaffold_key) {
  String _module, _note = "", _title = "";
  var dateWithoutFormat, _date = " - ";
  int red_bg = 0xFFe1323b, red_high = 0xFFb6152b;

  if (modulesList.isNotEmpty) _module = modulesList[0];

  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(red_bg),
      child: StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 470,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(red_high),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      child: Hero(
                        tag: "Add",
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                    Text(
                      "Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.transparent,
                      size: 50,
                    )
                  ],
                ),
                SizedBox(height: 15),
                Expanded(
                    child: SingleChildScrollView(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(children: <Widget>[
                              TextField(
                                cursorColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  labelStyle: new TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  labelText: 'Title',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (String title) {
                                  setState(() {
                                    _title = title;
                                  });
                                },
                                onSubmitted: (String title) {
                                  setState(() {
                                    _title = title;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              TextField(
                                cursorColor: Colors.white,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                decoration: InputDecoration(
                                  labelText: 'Note',
                                  focusColor: Colors.white,
                                  labelStyle: new TextStyle(
                                      color: Colors.white, fontSize: 20),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onChanged: (String note) {
                                  setState(() {
                                    _note = note;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        color: Color(red_bg),
                                        size: 20,
                                      ),
                                      Text("   " + _date,
                                          style: TextStyle(
                                              color: Color(red_bg),
                                              fontSize: 20)),
                                      ButtonTheme(
                                          minWidth: 0,
                                          child: IconButton(
                                            focusColor: Colors.black12,
                                            highlightColor: Colors.transparent,
                                            iconSize: 20,
                                            icon: Icon(
                                              Icons.edit,
                                              color: Color(red_bg),
                                            ),
                                            onPressed: () {
                                              DatePicker.showDatePicker(context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(2020, 1, 1),
                                                  maxTime: DateTime(2025, 6, 7),
                                                  onConfirm: (date) {
                                                setState(() {
                                                  dateWithoutFormat = date;
                                                  _date = DateFormat(
                                                          "EEE, dd MMM")
                                                      .format(
                                                          dateWithoutFormat);
                                                });
                                              },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.en);
                                            },
                                          )),
                                    ]),
                              ),
                              SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: modulesList.isEmpty
                                    ? SizedBox(
                                        width: double.infinity,
                                        height: 45,
                                        child: Center(
                                            child: Text(
                                          "No modules found \n Please add modules in profile",
                                          style:
                                              TextStyle(color: Color(red_bg)),
                                          textAlign: TextAlign.center,
                                        )))
                                    : DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          dropdownColor: Colors.white,
                                          isExpanded: true,
                                          value: _module,
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(red_bg),
                                          ),
                                          iconSize: 30,
                                          elevation: 0,
                                          style: TextStyle(
                                              color: Color(red_bg),
                                              fontSize: 20),
                                          onChanged: (newValue) {
                                            setState(() {
                                              _module = newValue;
                                            });
                                          },
                                          items: modulesList.map((value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                              ),
                            ])))),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        highlightColor: Color(red_high),
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
                        onPressed: () {
                          if (_title.isNotEmpty && _module.isNotEmpty) {
                            final task = Task(
                                title: _title,
                                note: _note,
                                module: _module,
                                dueDate: dateWithoutFormat);
                            database.insertTask(task);
                            Navigator.pop(context);
                          } else {
                            Toast.show(
                                "Please add Title and Module",
                                context,
                                gravity: Toast.CENTER,
                                duration: Toast.LENGTH_LONG,
                                backgroundRadius: 10);
                          }
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(color: Color(red_bg)),
                        ),
                      )
                    ],
                  ),
                )
              ]),
        );
      }));
}

editTaskDialog(BuildContext context, Task itemTask, List modulesList,
    AppDatabase database) {
  int red_bg = 0xFFe1323b, red_high = 0xFFb6152b, label_clr = 0xFFFFACA9;

  var noteController = new TextEditingController();
  noteController.text = itemTask.note;
  var titleController = new TextEditingController();
  titleController.text = itemTask.title;
  String _module = itemTask.module;
  var _date = itemTask.dueDate != null ? itemTask.dueDate : "";
  return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Color(red_bg),
      child: StatefulBuilder(// You need this, notice the parameters below:
          builder: (BuildContext context, StateSetter setState) {
        return Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    titleController.addListener(() {
                      database.updateTask(
                          itemTask.copyWith(title: titleController.text));
                    });
                  },
                ),
                SizedBox(height: 15),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Note",
                        style: TextStyle(fontSize: 18, color: Color(label_clr)),
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        controller: noteController,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        decoration: InputDecoration(
                          hintText: "-",
                          hintStyle: TextStyle(color:Color(label_clr)),
                          focusColor: Colors.white,
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          noteController.addListener(() {
                            database.updateTask(
                                itemTask.copyWith(note: noteController.text));
                          });
                        },
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Color(red_bg),
                          size: 20,
                        ),
                        Text(
                            _date.toString().isNotEmpty
                                ? DateFormat("EEE, dd MMM")
                                    .format(_date)
                                    .toString()
                                : "-",
                            style:
                                TextStyle(color: Color(red_bg), fontSize: 20)),
                        ButtonTheme(
                            minWidth: 0,
                            child: IconButton(
                              focusColor: Colors.black12,
                              highlightColor: Colors.transparent,
                              iconSize: 20,
                              icon: Icon(
                                Icons.edit,
                                color: Color(red_bg),
                              ),
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(2020, 1, 1),
                                    maxTime: DateTime(2025, 6, 7),
                                    onConfirm: (date_new) {
                                  setState(() {
                                    database.updateTask(
                                        itemTask.copyWith(dueDate: date_new));
                                    _date = date_new;
                                  });
                                },
                                    currentTime:
                                        _date != "" ? _date : DateTime.now(),
                                    locale: LocaleType.en);
                              },
                            )),
                      ]),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: modulesList.isEmpty
                      ? Text("No modules found")
                      : DropdownButtonHideUnderline(
                          child: DropdownButton(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            value: _module,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color(red_bg),
                            ),
                            iconSize: 30,
                            elevation: 0,
                            style:
                                TextStyle(color: Color(red_bg), fontSize: 20),
                            onChanged: (newValue) {
                              setState(() {
                                _module = newValue;
                                database.updateTask(
                                    itemTask.copyWith(module: newValue));
                              });
                            },
                            items: modulesList.map((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: RawMaterialButton(
                        highlightColor: Colors.white,
                        fillColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          database.deleteTask(itemTask);
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.delete_outline,
                            color: Color(red_high), size: 25),
                      ),
                    ),
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: RawMaterialButton(
                        highlightColor: Colors.white,
                        fillColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          if(titleController.text != "")
                          Navigator.pop(context);
                          else
                            Toast.show(
                                "Title cannot be empty",
                                context,
                                duration: Toast.LENGTH_LONG,
                                gravity: Toast.CENTER,
                                backgroundRadius: 10);
                        },
                        child: Icon(Icons.arrow_back_ios,
                            color: Color(red_high), size: 25),
                      ),
                    ),
                  ],
                )
              ],
            ));
      }));
}
