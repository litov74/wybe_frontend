// GLOBAL DEPENDENCIES
import 'dart:ui';
import "dart:async";
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/widgets.dart";

// LOCAL DEPENDENCIES (note: project rename may cause an error, be careful)
import "package:wybe_latest/models/user_model.dart";
import 'package:wybe_latest/screens/multi3_screen.dart';
import "package:wybe_latest/strings/strings.dart";

String fullLogoAsset = "assets/full_logo.jpg";
class Login_Screen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _Login_Screen();
  }

}

class _Login_Screen extends State<Login_Screen>{
  final _formKey = GlobalKey<FormState>();
  @override
  void initState(){
    super.initState();
    // TODO: connect DB to check "remember me" state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Column(
          key: _formKey,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(left: 10.0, top: 40.0, right: 10.0, bottom: 30.0),
              child: Image.asset(fullLogoAsset, scale: 3,),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: login,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                alignment: const Alignment(0, 0),
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: password
                        )
                      )
                    ),
                  ),
                  Positioned(
                    right: 15,
                    child: ElevatedButton(
                      onPressed: (){
                        // TODO: add password visibility
                      },
                      child: Text(show)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  //style: ElevatedButton.styleFrom({
                  // primary: Colors.green,
                  //}),
                  //color: Colors.green,
                  // TODO: get out about color!
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text(loading)));
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context)=>Multi3()));
                  },
                  child: Text(
                      submit,
                      style: TextStyle(color: Colors.white),
                  ),
                  //shape: RoundedRectangleBorder(
                  //  borderRadius: new BorderRadius.circular(18.0),
                  //  side: BorderSide(color: Colors.green)
                  //),
                  // TODO: get out about shapes..
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  //style: ElevatedButton.styleFrom({
                  // primary: Colors.green,
                  //}),
                  //color: Colors.green,
                  // TODO: get out about color!
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text(loading)));
                    }

                  },
                  child: Text(
                    register,
                    style: TextStyle(color: Colors.white),
                  ),
                  //shape: RoundedRectangleBorder(
                  //  borderRadius: new BorderRadius.circular(18.0),
                  //  side: BorderSide(color: Colors.green)
                  //),
                  // TODO: get out about shapes..
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}