import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: dark ? Colors.black87 : Colors.teal[50],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset('assets/images/loading_gif.gif'),
              ),
              Text(
                'loading...',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w200,
                  color: dark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
