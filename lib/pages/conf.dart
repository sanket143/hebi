import 'dart:async';

import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Hebi {
  static const String dbPath = "hebi.db";
  static SharedPreferences prefs;
  static StreamController<bool> darkMode = StreamController.broadcast();

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
    darkMode.add(prefs.getBool("darkMode") ?? false);
  }

  static setDarkMode(bool value) async {
    prefs.setBool("darkMode", value);
    darkMode.add(value);
  }

  static Future<Database> getDatabase() async {
    final directory = await getApplicationDocumentsDirectory();

    DatabaseFactory dbFactory = databaseFactoryIo;

    // We use the database factory to open the database
    Database db = await dbFactory.openDatabase(join(directory.path, dbPath));
    
    return db;
  }
}

class CustomAppBarTheme {
  static TextTheme getTextTheme(BuildContext context){
    return Theme.of(context).brightness == Brightness.light
      ? TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w500
        ),
      )
      : Theme.of(context).textTheme;
  }

  static IconThemeData getIconTheme(BuildContext context){
    return IconThemeData(
      color:Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Theme.of(context).iconTheme.color,
    );
  }

  static Color getBackgroundColor(BuildContext context){
    return Theme.of(context).brightness == Brightness.light
      ? Theme.of(context).primaryColor
      : Theme.of(context).appBarTheme.color;
  }
}

class Themes {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.teal,
    appBarTheme: AppBarTheme(
      color: Colors.white,
    ),
    primaryTextTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.teal,
      ),
    ),
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: Colors.grey[900],
  );
}
