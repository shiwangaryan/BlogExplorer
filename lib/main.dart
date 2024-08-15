import 'package:blogexplorer/screens/home_screen.dart';
import 'package:blogexplorer/screens/loading_screen.dart/loading_screen.dart';
import 'package:blogexplorer/service/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:blogexplorer/service/cubit/loading_cubit.dart';
import 'package:blogexplorer/service/cubit/loading_state.dart';
import 'package:blogexplorer/service/bloc/theme_bloc/theme_bloc.dart';
import 'package:blogexplorer/service/bloc/theme_bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(
          create: (_) => NavigationBloc(),
        ),
        BlocProvider(
          create: (_) => LoadingCubit()..initializeApp(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, LoadingState>(
      builder: (context, state) {
      if (state is LoadingComplete) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeState.themeData,
              home: const HomeScreen(),
            );
          },
        );
      }
      return const LoadingScreen();
    });
  }
}
