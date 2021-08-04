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
import "package:logger/logger.dart";

// LOCAL DEPENDENCIES (note: project rename may cause an error, be careful)
import "package:wybe_latest/models/user_model.dart";
import 'package:wybe_latest/screens/auth_screen.dart';
import 'package:wybe_latest/screens/multi3_screen.dart';
import 'package:wybe_latest/screens/register_screen.dart';
import "package:wybe_latest/strings/strings.dart";
import "package:wybe_latest/screens/main_screen.dart";
import "package:wybe_latest/net/fire_auth.dart";

String fullLogoAsset = "assets/wybe.png";
class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Login_Screen();
  }

}

class _Login_Screen extends State<Login_Screen> {
  final _formKey = GlobalKey<FormState>();
  var logger = Logger();
  bool _obscureText = true;
  final login_controller = TextEditingController();
  final passw_controller = TextEditingController();

  void obscure(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    login_controller.dispose();
    passw_controller.dispose();
    super.dispose();
  }

  final ButtonStyle style_one =
      ElevatedButton.styleFrom(
          shadowColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          onPrimary: Colors.deepPurple,
          onSurface: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.deepPurple),
        ),
      );

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
  void initState(){
    super.initState();
    // TODO: connect DB to check "remember me" state
  }



  @override
  Widget build(BuildContext context) {
    //Future<FirebaseApp> _initializeFirebase() async {
    //  FirebaseApp firebaseApp = await Firebase.initializeApp();
    //  User? user = FirebaseAuth.instance.currentUser;
    //  logger.d("login_screen.dart 88 ${user}");
    //  if (user != null) {
    //    Navigator.of(context).pushReplacement(
    //      MaterialPageRoute(
    //        builder: (context) => Main_Screen(
    //          user: user,
    //        ),
    //      ),
    //    );
    //  }
    //  return firebaseApp;
    //}
    FirebaseAuth auth = FirebaseAuth.instance;

    //auth.authStateChanges().listen((User? user) {
    //  if(user != null){
    //    Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => Main_Screen(
    //         user: user,
    //         ),
    //       ),
    //     );
    //  }
    //});


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: FutureBuilder(
        //future: _initializeFirebase(),
        builder: (context, snapshot)
        {
          var logger = Logger();
          logger.d(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
                key: _formKey,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Container(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 40.0, right: 10.0, bottom: 50.0),
                    child: Image.asset(fullLogoAsset, scale: 3,),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(

                          cursorColor: Colors.deepPurple,
                          controller: login_controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: login,
                            fillColor: Colors.deepPurple,
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
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(left: 15,
                                  right: 15,
                                  top: 5),
                              child: TextFormField(
                                  controller: passw_controller,
                                  obscureText: _obscureText,

                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: password,

                                  )
                              )
                          ),
                        ),
                        Positioned(
                          right: 25,
                          child: ElevatedButton(
                            //style: style,
                            style: style_one,
                            child: Icon(Icons.remove_red_eye_outlined, color: Colors.white,),

                            // TODO: add password visibility
                            // TODO: fix missing text
                            onPressed: (){
                              obscure();
                              //if(_obscureText){
                              //  Text(show, style: TextStyle(color: Colors.white),);
                              //}else{
                              //  Text(show, style: TextStyle(color: Colors.white),);
                              //}
                            },

                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 30.0, right: 10.0, bottom: 10.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: style_one,
                        onPressed: () async {
                          //showDialog( //debug only!
                          //    context: context,
                          //    builder: (context){
                          //      return AlertDialog(
                          //        content: Text(login_controller.text + "\n" + passw_controller.text),
                          //      );
                          //    }
                          //);

                          if (passw_controller.text != "" && login_controller.text != "") {
                            logger.d("login_screen 198 ${_formKey.currentState}");
                            if (_formKey.currentState!.validate()) {

                              //User user = await FireAuth.signInUsingEmailAndPassword(email: login_controller.text, password: passw_controller.text, BuildContext: context);
                              //User user = await FireAuth.signInUsingEmailPassword(email: login_controller.text, password: passw_controller.text, context: context);
                              //logger.d("login_screen 205 ${user}");
                              //if (user != null) {
                              //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Main_Screen(user: user)),);
                              //}
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: login_controller.text,
                                    password: passw_controller.text
                                );
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Main_Screen(user: userCredential)));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  logger.d("user not found ${e}");
                                } else if (e.code == 'wrong-password') {
                                  logger.d("wrong password ${e}");
                                }
                              }

                            }




                          } else {
                            showDialog( //debug only!
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(missedData),
                                  );
                                });
                          }

                          //onPressed for Submit button
                        },
                        child: Text(
                          submit,
                          style: TextStyle(color: Colors.white),
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(

                        style: style_two,
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register_Screen()));
                          // onPressed for Register button
                        },
                        child: Text(
                          register,
                          style: TextStyle(color: Colors.deepPurple),
                        ),

                      ),
                    ),
                  ),
                ],
              );

          }else{
            return AlertDialog(content: Text(superAchtung),);
          }
        },
      ),
    );
  }


}