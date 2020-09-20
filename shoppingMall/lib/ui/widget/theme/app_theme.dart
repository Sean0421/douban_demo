import 'package:flutter/material.dart';

class SHAppTheme {
  static const double smallFontSize = 14;
  static const double normalFontSize = 18;
  static const double largeFontSize = 24;

  static const Color normalColor = Colors.black;
  static const Color darkColor = Colors.green;


  static final ThemeData normalTheme = ThemeData(
      primaryColor: Colors.pink,
  );

  static final ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: smallFontSize, color: darkColor)
      )
  );
}
