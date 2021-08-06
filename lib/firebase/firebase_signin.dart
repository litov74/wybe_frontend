

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebase_SignIn{

  void signInWithEmail(email, password) async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password
      );

    } on FirebaseAuthException catch(e){
      if (e.code == 'user-not-found'){
        print('not found');
      } else if (e.code == "wrong-password"){
        print('wrong password');
      }
    }

  }

}