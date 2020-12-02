import 'package:flutter/material.dart';

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
