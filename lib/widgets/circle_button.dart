import 'package:flutter/material.dart';

import '../constants.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final VoidCallback? onPressed;

  const CircleButton(
      {super.key,
      required this.icon,
      required this.iconSize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: GREY[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        iconSize: iconSize,
        color: BLACK,
      ),
    );
  }
}
