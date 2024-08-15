import 'package:blogexplorer/screens/list_screen/blog_list_screen.dart';
import 'package:blogexplorer/service/api/api_method.dart';
import 'package:blogexplorer/service/get_it/get_it_blog_service.dart';
import 'package:blogexplorer/theme/bloc/theme_bloc.dart';
import 'package:blogexplorer/theme/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('allBlogs');
  await Hive.openBox('bookmarks');

  getIt.registerSingleton<GetItBlogService>(GetItBlogService());
  await getAPIBlogs();

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
