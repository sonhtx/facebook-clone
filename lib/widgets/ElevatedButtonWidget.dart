



import 'package:flutter/material.dart';

import '../constants.dart';

class ElevatedButtonWidget extends StatelessWidget{
  final String buttonText;
  final double paddingTop;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const ElevatedButtonWidget({super.key, required this.buttonText, this.paddingTop = 0, this.textColor = BLACK,
    required this.backgroundColor, this.borderColor = CYAN, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Set the background color to transparent
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: borderColor)
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor, // Text color
          ),
        ),
      ),
    );

  }




}


