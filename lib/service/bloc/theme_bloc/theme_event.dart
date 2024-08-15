import 'package:flutter/material.dart';

abstract class ThemeEvent {}

class SystemThemeChangedEvent extends ThemeEvent {
  final Brightness brightness;

  SystemThemeChangedEvent(this.brightness);
}