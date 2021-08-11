import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/widgets.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wybe/firebase/firebase_getdata.dart';
import 'package:wybe/screens/logout_screen.dart';
import 'package:wybe/strings/strings.dart';
import 'package:firebase_database/firebase_database.dart';
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

    final databaseReference = FirebaseDatabase.instance.reference();
    var futureBuilder=new FutureBuilder(

      future: GetData().firebaseCalls(databaseReference), // async work
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none: return new Text(superAchtung);
          case ConnectionState.waiting: return new Text(wait);
          default:
            if (snapshot.hasError)
              return new Text('${superAchtung}\n${snapshot.error}');
            else
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      elevation: 0.0, //TODO: edit this
                      child: Padding(
                        padding: EdgeInsets.all(0.0), //TODO: edit this
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.15, //TODO: what is it?
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 0,
                            child: Row(
                              children: <Widget>[
                                new Container(
                                  child: Image.network(
                                      snapshot.data[index].profilePicRoute,
                                      height: MediaQuery.of(context).size.width*0.3,
                                      width: MediaQuery.of(context).size.width*0.3,
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(left: 10, right: 5, top: 5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                if(snapshot.data[index].isOnline==true)
                                                  new Icon(Icons.adb_rounded, color: Colors.green,)
                                                else
                                                  new Icon(Icons.adb_rounded, color: Colors.red,),
                                                SizedBox(width: 5,),
                                                Text(snapshot.data[index].name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,fontFamily: 'Roboto-Black'),)
                                              ],
                                            ),
                                            SizedBox(height: 10.0,),
                                            Row(
                                              children: <Widget>[
                                                new IconTheme(
                                                    data: new IconThemeData(color: Colors.black26),
                                                    child: new Icon(Icons.timer, size: 20.0,)
                                                ),
                                                Text('${snapshot.data[index].rating}',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black26),)
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                )
                              ],
                            ),
                          )
                        )
                      ),
                    );
                  }
              );
        }
      }
    );


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.deepPurple,
        title: Image.asset(logo, scale: 10), //TODO: look for droid version. IOS looks nice)
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
                  child: futureBuilder,
                )
            )
          ]
      ),
    );



  }

}
