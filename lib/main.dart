import 'package:blogexplorer/screens/list_screen/blog_list_screen.dart';
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
        debugShowCheckedModeBanner: false,
        theme: themeState.themeData,
        home: const BlogListScreen(),
      );
    });
  }
}
