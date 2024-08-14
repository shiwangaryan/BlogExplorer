import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;

    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "View\nBookmarks",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 40),
            ),
            const SizedBox(height: 12),
            Container(
              height: 2,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}
