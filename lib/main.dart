import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import './academic.dart';
import './activities.dart';
import './exams.dart';
import './classes.dart';
import './profile.dart';
import './custom_icons.dart';
import './welcome_details.dart';
import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // getting app directory to store profile details
  final appDirectory = await path_provider.getApplicationDocumentsDirectory();
  // initalizing hive db to store profile details
  Hive.init(appDirectory.path);
  Future<List<Box>> _openBox() async {
    await Hive.openBox('user_details');
    await Hive.openBox('modules');
    await Hive.openBox('skills');
    await Hive.openBox('profile_complete');
  }

  runApp(
      new MaterialApp(
    home: FutureBuilder(
      future: _openBox(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError)
            return Text(snapshot.error.toString());
          else
            return  Hive.box('profile_complete').isNotEmpty ? MyApp() : new WelcomePage(); // !Hive.box('user_details').isEmpty ? MyApp() : new WelcomePage();
        }
        else
          return Scaffold();
      },
  )));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Color(0xFFF8F8F8),
    statusBarColor: Colors.transparent, // status bar color
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  Hive.close();
}


class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new SplashScreen(
        seconds: 1,
        photoSize: 50.0,
        loaderColor: Hive.box('profile_complete').isNotEmpty ? Colors.white : Colors.red,
        navigateAfterSeconds: new AfterSplash(),
        image: new Image.asset("assets/Avatars/1.png"),
        backgroundColor: Colors.white ,
      ),
    );
  }
}

class AfterSplash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AfterSplashState();
  }
}


class AfterSplashState extends State<AfterSplash> {
  int _selectedPage = 2;
  var _pageController = PageController(initialPage: 2);

  final _pageOptions = [
    Exams(),
    Classes(),
    Academic(),
    Activities(),
    Profile()
  ];

  int index = 2;

  @override
  Widget build(BuildContext context) {

    return Provider(
      create: (_) => AppDatabase(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "College Companion",
          home: Scaffold(
            body: PageView(
                children: _pageOptions,
                onPageChanged: (index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                controller: _pageController,
                physics: BouncingScrollPhysics()),

            bottomNavigationBar: BottomNavigationBar(
              // setting attributes for the bar
              unselectedItemColor: Colors.black38,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,

              currentIndex: _selectedPage,
              onTap: (index) {
                setState(() {
                  _pageController.jumpToPage(index);
                });
              },

              items: [
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.test),
                  backgroundColor: Colors.white,
                  activeIcon: Icon(
                    CustomIcons.test,
                    color: Color(0xFF05989B),
                    size: 30,
                  ),
                  title: Text('Exam'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.calendar),
                  backgroundColor: Colors.white,
                  activeIcon: Icon(
                    CustomIcons.calendar,
                    color: Color(0xFF861657),
                    size: 30,
                  ),
                  title: Text('Classes'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.list),
                  backgroundColor: Colors.white,
                  activeIcon: Icon(
                    CustomIcons.list,
                    color: Color(0xFFc71831),
                    size: 30,
                  ),
                  title: Text('Academic'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.scout),
                  backgroundColor: Colors.white,
                  activeIcon: Icon(
                    CustomIcons.scout,
                    color: Color(0xFF0488e3),
                    size: 30,
                  ),
                  title: Text('Activities'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(CustomIcons.man_avatar),
                  backgroundColor: Colors.white,
                  activeIcon: Icon(
                    CustomIcons.man_avatar,
                    color: Color(0xFF9e1bd6),
                    size: 30,
                  ),
                  title: Text('Profile'),
                ),
              ],
            ),
          )),
       // dispose: (context, db) => db.close()
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "College Companion",
        home: Welcome(context)

    );
  }
}
