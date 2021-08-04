import "package:flutter/widgets.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),

    );
  }


}