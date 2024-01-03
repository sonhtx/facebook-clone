import 'package:flutter/material.dart';

import '../constants.dart';

class CardItem extends StatelessWidget {
  final double width;
  final double height;
  final Widget widget;
  final String label;
  final double fontSize;
  final VoidCallback onPressed;

  const CardItem(
      {super.key,
      required this.width,
      required this.label,
      this.fontSize = 15.0,
      required this.widget,
      required this.height,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      surfaceTintColor: WHITE,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: BLUE.withAlpha(30),
        onTap: onPressed,
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                widget,
                const SizedBox(width: 15.0),
                Text(label, style: TextStyle(fontSize: fontSize)),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
