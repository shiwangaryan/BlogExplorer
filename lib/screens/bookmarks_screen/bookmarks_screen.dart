import 'package:blogexplorer/screens/bookmarks_screen/bookmarks_screen_body.dart';
import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        flexibleSpace:
            Container(color: Theme.of(context).scaffoldBackgroundColor),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 0, top: 1),
          color: dark ? Colors.white : Colors.black,
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            grade: 0.5,
          ),
        ),
      ),
      body: const BookmarksScreenBody(),
    );
  }
}
