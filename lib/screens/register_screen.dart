import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wybe_latest/net/fire_auth.dart';
import 'package:wybe_latest/net/validator.dart';
import 'package:wybe_latest/screens/login_screen.dart';
import 'package:wybe_latest/strings/strings.dart';

import 'main_screen.dart';
String fullLogoAsset = "assets/wybe.png";

class Register_Screen extends StatefulWidget{
  const Register_Screen({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _Register_Screen();
  }

}


class _Register_Screen extends State<Register_Screen>{
  final _formKey = GlobalKey<FormState>();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  final login_controller = TextEditingController();
  final passw_controller = TextEditingController();
  final passw_again_controller = TextEditingController();
  final nick_controller = TextEditingController();
  final gender_controller = TextEditingController();
  final city_controller = TextEditingController();
  bool _obscure = true;
  bool _obscure2 = true;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    login_controller.dispose();
    passw_controller.dispose();
    passw_again_controller.dispose();
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

  void obscure1(){
    setState(() {
      _obscure = !_obscure;
    });
  }

  void obscure2(){
    setState(() {
      _obscure2 = !_obscure2;
    });
  }


  @override
  void initState(){
    super.initState();
    // TODO: connect DB to check "remember me" state
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.deepPurple,
        title: Text(register),
        leading: GestureDetector(
          onTap: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login_Screen()),);
          },
          child: Icon(Icons.arrow_back),

        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      //floatingActionButton: new FloatingActionButton(
      //  onPressed: (){
      //    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login_Screen()));
      //  },
      //  shape: RoundedRectangleBorder(
      //    borderRadius: new BorderRadius.circular(18.0),
      //    side: BorderSide(color: Colors.deepPurple),

      //  ),
      //  backgroundColor: Colors.deepPurple,
      //  child: const Icon(Icons.arrow_back),
      //  clipBehavior: Clip.,
      //),
      //floatingActionButtonLocation: CustomFloatingActionButtonLocation(FloatingActionButtonLocation.centerFloat, 0, -56),
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.done) {
            logger.d(snapshot.connectionState);
            return Column(
              key: _formKey,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                  child: Image.asset(fullLogoAsset, scale: 10,),
                ),
                
                Expanded(
                  child: ListView(

                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    padding: EdgeInsets.all(25.0),
                    children: <Widget>[
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
                              controller: login_controller,
                              validator: (value) => Validator.validateEmail(email: value!),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
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
                                color: Colors.white,
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                                  child: TextFormField(
                                      controller: passw_controller,
                                      validator: (value) => Validator.validatePassword(password: value!),
                                      obscureText: _obscure,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: password
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
                                onPressed: obscure1,
                              ),
                            ),
                          ],
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
                                      controller: passw_again_controller,
                                      obscureText: _obscure2,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: passwordConfirm
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
                                onPressed: obscure2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              validator: (value) => Validator.validateName(name: value!),
                              controller: nick_controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: nick,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              controller: gender_controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: gender,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              controller: city_controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: city,
                              ),
                            ),
                          ),
                        ),
                      ),

                    ]
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 25.0),
                  child: Container(
                      //padding: const EdgeInsets.all(10.0),
                      height: 50.0,
                      width: double.infinity,
                      child: ElevatedButton(
                        style:style_one,
                        onPressed: () async {
                          logger.d("${_formKey.currentState!}");
                          //&& _formKey.currentState!.validate()

                          if (passw_controller.text != "" && login_controller.text != "" && passw_again_controller.text != "" && nick_controller.text != "" && gender_controller.text != "" && city_controller.text != ""  ) {
                            User? user = await FireAuth
                                .registerUsingEmailPassword(
                              name: nick_controller.text,
                              email: login_controller.text,
                              password: passw_controller.text,
                            );
                            logger.d("${user} ${nick_controller.text} ${login_controller.text} ${passw_controller.text}");
                            //if (user != null){
                            //  Navigator.of(context).pushReplacement(
                            //    MaterialPageRoute(
                            //      builder: (context) => Main_Screen(user: user),
                            //    ),
                            //  );
                            //}

                          } else {
                            showDialog( //debug only!
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(missedData),
                                  );
                                });
                          }
                        },
                        child: Text(
                          submit,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
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