import 'package:flutter/material.dart';
import 'package:wybe/screens/multi3_screen.dart';
import 'package:wybe/screens/auth_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);

    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Wybe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Auth_Screen()

    );
  }
}
