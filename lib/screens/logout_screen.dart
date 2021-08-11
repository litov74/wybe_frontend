import "dart:async";
import "package:flutter/widgets.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wybe/firebase/firebase_signin.dart';
import 'package:wybe/screens/main_screen.dart';
import 'package:wybe/screens/register_screen.dart';
import 'package:wybe/strings/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';


String fullLogoAsset = "assets/wybe.png";
class Logout_Screen extends StatefulWidget {
  const Logout_Screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Logout_Screen();
  }

}

class _Logout_Screen extends State<Logout_Screen> {
  FirebaseAuth auth = FirebaseAuth.instance;
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
    //FirebaseAuth.instance.authStateChanges().listen((User? user){
    //  if(user != null){
    //    Navigator.pushReplacement(
    //        context,
    //        MaterialPageRoute(
    //            builder: (context) => Main_Screen()));
    //  }
    //});
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
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
              child: Text(
                logout

              ),
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
                      onPressed: (){
                        obscure();
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
                    if(login_controller.text != "" && passw_controller.text != ""){
                      Firebase_SignIn().signInWithEmail(login_controller.text, passw_controller.text);
                      var currentUser = FirebaseAuth.instance.currentUser;
                      logger.d(currentUser.uid);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Main_Screen()));
                    }
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
        )
    );
  }


}