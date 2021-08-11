import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/widgets.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wybe/screens/logout_screen.dart';
import 'package:wybe/strings/strings.dart';

import 'login_screen.dart';

String logo = "assets/wybe.png";

class Main_Screen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Main_Screen();
  }

}

class _Main_Screen extends State<Main_Screen>{

  bool _isSendingVerification = false;
  bool _isSigningOut = false;


  @override
  void initState() {
    super.initState();
  }

  final ButtonStyle style_two =
  ElevatedButton.styleFrom(
    shadowColor: Colors.deepPurple,
    primary: Colors.white,
    onPrimary: Colors.white,
    onSurface: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.deepPurple),

    ),
  );

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.deepPurple,
        title: Image.asset(logo, scale: 10), //TODO: get out how it looks
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

          ]
      ),
    );
  }


}