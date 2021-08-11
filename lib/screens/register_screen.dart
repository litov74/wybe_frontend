import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wybe/firebase/firebase_register.dart';
import 'package:wybe/strings/strings.dart';

import 'login_screen.dart';
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
    nick_controller.dispose();
    gender_controller.dispose();
    city_controller.dispose();
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
      body: Column(
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
                          if(login_controller.text != "" &&
                          passw_controller.text != "" &&
                          passw_again_controller.text != "" &&
                          nick_controller.text != "" &&
                          gender_controller.text != "" &&
                          city_controller.text != ""){
                            Firebase_Register().registerWithEmail(login_controller.text, passw_controller.text);
                            var currentUser = FirebaseAuth.instance.currentUser;
                            logger.d(currentUser.uid);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Main_Screen()
                              )
                            );
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
            )


    );
  }

}