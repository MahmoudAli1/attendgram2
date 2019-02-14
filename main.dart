


import 'package:flutter/material.dart';


import 'login.dart';
import 'home_widget.dart';
import 'event_info_page.dart';
import 'Record_Page.dart';
import 'globals.dart';
import 'View_Account.dart';

void main() => runApp(new MaterialApp(home: new MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    Home.tag: (context) =>  Home(),
    EventInfoPage.tag: (context) => EventInfoPage(eventIndex),
    RecordPage.tag: (context) => RecordPage(),
    MyHomePage.tag: (context) => MyHomePage(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: LoginPage(),
      routes: routes,
    );
  }
}