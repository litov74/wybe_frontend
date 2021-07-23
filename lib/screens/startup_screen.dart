
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:wybe_latest/strings/strings.dart";

const String logoAsset = "assets/logo.jpg";


class Startup extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<Startup>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(logoAsset, scale: 2,),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              loading,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,

              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
              strokeWidth: 1,
            )
          ],
        ),
      )


    );



  }
  
}

