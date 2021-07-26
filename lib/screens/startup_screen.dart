// GLOBAL DEPENDENCIES
import 'dart:async';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

// LOCAL DEPENDENCIES (note: project rename may cause an error, be careful)
import 'package:wybe_latest/screens/login_screen.dart';
import "package:wybe_latest/strings/strings.dart";
import "package:wybe_latest/screens/auth_screen.dart";
import 'package:wybe_latest/strings/values.dart';


const String logoAsset = "assets/custom_logo.png";


// TODO: remove deprecated classes

class Startup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StartState();
  }
}

class StartState extends State<Startup>{

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }
  
  route(){
    Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => Login_Screen()));
  }

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
            //Padding(padding: EdgeInsets.only(top: 20)),
            //Text(
            //  loading,
            //  style: TextStyle(
            //    fontSize: 20,
            //    color: Colors.grey,
            //
            //  ),
            //),
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

// end of deprecated classes


class AnimatedGradient extends StatefulWidget{
  @override
  _AnimatedGradientState createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient>{

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 8);
    return Timer(duration, route);
  }

  route(){
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login_Screen()));
  }

  List<Color> colorList = [
    Colors.lightBlue.shade300,
    Colors.white
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft
  ];
  int index = 0;
  Color bottomColor = Colors.white;
  Color topColor = Colors.lightBlue.shade300;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000), (){
      setState(() {
        bottomColor = Colors.lightBlue.shade300;
      });

    });

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
              duration: Duration(seconds: 4),
              onEnd: (){
                setState(() {
                  index += 1;
                  bottomColor = colorList[index % colorList.length];
                  topColor = colorList[(index + 2) % alignmentList.length];
                });
              },
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: begin, end: end, colors: [bottomColor, topColor]
              )
            ),
          ),
          Positioned.fill(
              child: Image.asset(logoAsset, scale: 1, )
          )
        ]
      )
    );
  }

}