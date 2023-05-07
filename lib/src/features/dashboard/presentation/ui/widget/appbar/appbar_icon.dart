import 'package:flutter/material.dart';

// local imports
import '../../../../../config/theme/responsiveness.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: ScaleUi.responsiveFontSize(context, 30.0),
        color: Colors.black,
      ),
    );
  }
}
