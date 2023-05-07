import 'package:flutter/material.dart';

// local import
import './appbar_icon.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({Key? key, required this.drawer}) : super(key: key);
  final GlobalKey<ScaffoldState> drawer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarIcon(
          icon: Icons.sort,
          onTap: () {
            drawer.currentState!.openDrawer();
          },
        ),
        AppBarIcon(
          icon: Icons.search,
          onTap: () {},
        ),
      ],
    );
  }
}
