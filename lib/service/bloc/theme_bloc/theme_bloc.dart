import 'package:blogexplorer/service/bloc/theme_bloc/theme_event.dart';
import 'package:blogexplorer/service/bloc/theme_bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(_initialThemeState()) {
    WidgetsBinding.instance.addObserver(_systemBrightnessObserver(this));

    on<SystemThemeChangedEvent>((event, emit) {
      emit(event.brightness == Brightness.dark ? DarkTheme() : LightTheme());
    });
  }

  static ThemeState _initialThemeState() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark ? DarkTheme() : LightTheme();
  }
}

class _systemBrightnessObserver extends WidgetsBindingObserver {
  final ThemeBloc _themeBloc;

  _systemBrightnessObserver(this._themeBloc);

  @override
  void didChangePlatformBrightness() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    _themeBloc.add(SystemThemeChangedEvent(brightness));
  }
}
