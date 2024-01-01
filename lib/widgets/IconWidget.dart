
import 'package:flutter/material.dart';

import '../constants.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon, required this.onPressed, this.color = GREY});
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: onPressed,
    );
  }

}
