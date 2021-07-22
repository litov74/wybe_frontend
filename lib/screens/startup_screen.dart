import "package:flutter/material.dart";

String appbar_text = "W"; // TODO: must be removed!
String logo_asset = "assets/logo.jpg";


class Startup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(
        //  title: Text(appbar_text),
        //),

        body: Card(child: Column(children:<Widget>[

          FittedBox(child: Image.asset(logo_asset), fit: BoxFit.fill),
          //Text(appbar_text)
        ],),),
      ),
    );
  }
}