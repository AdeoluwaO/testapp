import 'package:flutter/material.dart';
import 'dart:io' show Platform;

//local imports
import './responsiveness.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    ScaleUi().init(context);
    return Platform.isIOS
        ? SafeArea(child: Center(child: child))
        : Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScaleUi.safeBlockHorizontal * 16,
                vertical: ScaleUi.safeBlockHorizontal * 16),
            child: Center(child: child),
          );
  }
}
