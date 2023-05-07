import 'package:flutter/material.dart';

class ScaleUi {
  static double responsiveFontSize(BuildContext context, double fontSize) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    var _scaleFactor = screenWidth / 375;

    if (screenWidth > screenHeight) {
      _scaleFactor = screenHeight / 812;
    }
    return fontSize * _scaleFactor;
  }

  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    safeBlockHorizontal = screenWidth / 375;
    safeBlockVertical = screenHeight / 812;
  }
}
