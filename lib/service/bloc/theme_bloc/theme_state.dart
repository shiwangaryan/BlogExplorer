import 'package:blogexplorer/theme/theme.dart';
import 'package:flutter/material.dart';

abstract class ThemeState {
  ThemeData get themeData;
}

class LightTheme extends ThemeState {
  @override
  ThemeData get themeData => AppTheme.lightTheme;
}

class DarkTheme extends ThemeState {
  @override
  ThemeData get themeData => AppTheme.darkTheme;
}