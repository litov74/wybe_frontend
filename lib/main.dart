// GLOBAL DEPENDENCIES
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// LOCAL DEPENDENCIES (note: project rename may cause an error, be careful)
import "package:wybe_latest/screens/startup_screen.dart";

String sql_statement = "CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, phone TEXT, status TEXT, friends INTEGER, isRemember INTEGER)";
// project entry point

void main() async{
  runApp(MyApp());
  // running MyApp, then opening connection to DB. Hope, that connection won't be closed but I'm nut sure
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), "user_database.db"),
    onCreate: (db, version){
      return db.execute(sql_statement,);
    },
    version: 1,
  );
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AnimatedGradient()
    );
  }

}
