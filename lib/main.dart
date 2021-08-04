import 'package:flutter/material.dart';
import 'package:wybe/screens/startup_screen.dart';


String sql_statement = "CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, phone TEXT, status TEXT, friends INTEGER, isRemember INTEGER)";


void main() async{
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

  @override
  Widget build(BuildContext context){
    return MyApp();
  }

}