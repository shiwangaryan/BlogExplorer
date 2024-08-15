import 'package:blogexplorer/screens/bookmarks_screen/bookmarks_screen.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.black,
        child: const Icon(
          size: 32,
          Icons.bookmark_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const BookmarksScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1, 0);
      const end = Offset(0, 0);
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetTween = animation.drive(tween);

      return SlideTransition(
        position: offsetTween,
        child: child,
      );
    },
  );
}
