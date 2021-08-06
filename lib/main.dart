import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wybe/screens/startup_screen.dart';


String sql_statement = "CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, phone TEXT, status TEXT, friends INTEGER, isRemember INTEGER)";


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EntryPoint());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:AnimatedGradient()
    );
  }

}

class EntryPoint extends StatefulWidget{
  @override
  _EntryPoint createState() => _EntryPoint();
}

class _EntryPoint extends State<EntryPoint>{

  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async{
    try{
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e){
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState(){
    initializeFlutterFire();
    super.initState();
  }


  @override
  Widget build(BuildContext context){
    var logger = Logger();
    logger.d("${_error} ${_initialized}");
    return MyApp();
  }

}