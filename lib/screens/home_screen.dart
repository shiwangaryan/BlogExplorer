import 'package:blogexplorer/screens/bookmarks_screen/bookmarks_screen_body.dart';
import 'package:blogexplorer/screens/list_screen/blog_list_screen_body.dart';
import 'package:blogexplorer/service/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:blogexplorer/service/bloc/navigation_bloc/navigation_state.dart';
import 'package:blogexplorer/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;

    return Scaffold(
      drawer: customDrawer(context),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return Container(
            margin: const EdgeInsets.only(left: 5.0, top: 5),
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 20,
              icon: !dark
                  ? Image.asset('assets/images/menu_burger_light.png')
                  : Image.asset('assets/images/menu_burger_dark.png'),
            ),
          );
        }),
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationStateChanged) {
            return state.index == 0
                ? const BlogListScreenBody()
                : const BookmarksScreenBody();
          }
          return Container();
        },
      ),
    );
  }
}
