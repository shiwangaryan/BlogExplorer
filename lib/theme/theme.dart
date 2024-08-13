import 'package:flutter/material.dart';

class AppTheme {
  //defining constants
  static const Color lightThemeColor = Colors.black;
  static const Color darkThemeColor = Colors.white;

  //defining text styles:
  static TextStyle miniTitle(Color color) => TextStyle(
        fontFamily: 'HelveticaNeue',
        fontWeight: FontWeight.w400,
        fontSize: 20,
        color: color,
      );

  static TextStyle largeTitle(Color color) => TextStyle(
        fontFamily: 'HelveticaNeue',
        fontWeight: FontWeight.w600,
        fontSize: 32,
        color: color,
      );

  static TextStyle regular(Color color) => TextStyle(
        fontFamily: 'HelveticaNeue',
        fontWeight: FontWeight.w300,
        fontSize: 16,
        color: color,
      );

  //defining text theme
  static TextTheme textTheme(Color color) => TextTheme(
        headlineLarge: largeTitle(color),
        headlineSmall: miniTitle(color),
        bodyMedium: regular(color),
      );

  //light and dark theme here
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: darkThemeColor,
      textTheme: textTheme(lightThemeColor),
      fontFamily: 'HelveticaNeue',
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: lightThemeColor,
      textTheme: textTheme(darkThemeColor),
      fontFamily: 'HelveticaNeue',
    );
  }
}
