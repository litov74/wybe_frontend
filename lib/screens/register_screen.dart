import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wybe_latest/net/fire_auth.dart';
import 'package:wybe_latest/net/validator.dart';
import 'package:wybe_latest/strings/strings.dart';

import 'main_screen.dart';
String fullLogoAsset = "assets/rounded_logo.png";

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



  @override
  void initState(){
    super.initState();
    // TODO: connect DB to check "remember me" state
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              key: _formKey,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                  child: Image.asset(fullLogoAsset, scale: 10,),
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
                        controller: login_controller,
                        validator: (value) => Validator.validateEmail(email: value!),
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
                            padding: EdgeInsets.only(left: 15,
                                right: 15,
                                top: 5),
                            child: TextFormField(
                                controller: passw_controller,
                                validator: (value) => Validator.validatePassword(password: value!),
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
                          //style: style,
                          style: style_one,
                          child: Text(show,),

                          // TODO: add password visibility
                          // TODO: fix missing text
                          onPressed: () {

                          },

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
                          color: Colors.grey,
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 15,
                                right: 15,
                                top: 5),
                            child: TextFormField(
                                controller: passw_again_controller,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    labelText: passwordConfirm
                                )
                            )
                        ),
                      ),
                      Positioned(
                        right: 15,
                        child: ElevatedButton(
                          //style: style,
                          style: style_one,
                          child: Text(show,),

                          // TODO: add password visibility
                          // TODO: fix missing text
                          onPressed: () {

                          },

                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0, bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        validator: (value) => Validator.validateName(name: value!),
                        controller: nick_controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
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
                      color: Colors.grey,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        controller: gender_controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
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
                      color: Colors.grey,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        controller: city_controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: city,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: style_one,
                      onPressed: () async{
                        //showDialog( //debug only!
                        //    context: context,
                        //    builder: (context){
                        //      return AlertDialog(
                        //        content: Text(login_controller.text + "\n" + passw_controller.text),
                        //      );
                        //    }
                        //);


                        if (passw_controller.text != "" && login_controller.text != "" && passw_again_controller.text != "" && nick_controller.text != "" && gender_controller.text != "" && city_controller.text != "" && _formKey.currentState!.validate() ) {
                          User? user = await FireAuth
                              .registerUsingEmailPassword(
                            name: nick_controller.text,
                            email: login_controller.text,
                            password: passw_controller.text,
                          );
                          if (user != null){
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => Main_Screen(user: user),
                                ),
                                ModalRoute.withName('/'),
                            );
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