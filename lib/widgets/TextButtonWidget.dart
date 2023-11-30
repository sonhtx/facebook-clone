



import 'package:flutter/material.dart';

import '../constants.dart';

class TextButtonWidget extends StatelessWidget{
  final String buttonText;
  final double paddingTop;
  final double paddingLeft;

  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;

  final double radiusRoundBorder;

  final VoidCallback onPressed;

  const TextButtonWidget({super.key, required this.buttonText, this.paddingTop = 0, required this.textColor,
    required this.backgroundColor, this.borderColor = FBBLUE, required this.onPressed, this.paddingLeft = 0, this.radiusRoundBorder = 0});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop, left: paddingLeft),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: BLACK,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusRoundBorder), // Set border radius
          ),
        ),

        child: Text(buttonText),
        onPressed: () {},
      ),
    );

  }




}


