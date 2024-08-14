import 'package:flutter/material.dart';

class Sizes {
  BuildContext context;
  Sizes({required this.context});

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  double get smallImgHeight => screenHeight * 0.147;
  double get smallImgWidth => screenWidth * 0.425;

  double get largeImgHeight => screenHeight * 0.33;

  double get pixelRatio => MediaQuery.of(context).devicePixelRatio;
  int cacheSize(double size) => (size * pixelRatio).round();
}
