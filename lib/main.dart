import 'package:blogexplorer/theme/bloc/theme_bloc.dart';
import 'package:blogexplorer/theme/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return MaterialApp(
        theme: themeState.themeData,
        home: Scaffold(
          body: Container(
            child: const Center(
              child: Text(
                'Helvetica here',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 50,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
