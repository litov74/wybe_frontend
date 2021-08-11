import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/widgets.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wybe/screens/logout_screen.dart';

import 'login_screen.dart';



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
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: style_two,
                  onPressed: () {
                    var logger = Logger();
                    logger.d(FirebaseAuth.instance.currentUser.uid);
                    FirebaseAuth.instance.signOut();
                    logger.d(FirebaseAuth.instance.currentUser.uid);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Logout_Screen()));
                  },
                  child: Text(
                    "Выпилиться",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }


}