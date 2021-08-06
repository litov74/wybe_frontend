


import 'package:firebase_auth/firebase_auth.dart';

class Firebase_Register{

  void registerWithEmail(email, password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('weak password');
      } else if (e.code == 'email-already-in-use') {
        print('already used');
      }
    } catch (e) {
      print(e);
    }
  }


}