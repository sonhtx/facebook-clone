import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String buttonText;
  final double paddingTop;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onPressed;
  final double radius;
  final fontSize;
  final double width;

  const ButtonWidget({
    super.key,
    required this.buttonText,
    required this.paddingTop,
    required this.textColor,
    required this.backgroundColor,
    this.borderColor = Colors.cyan,
    required this.onPressed,
    this.radius = 20.0,
    this.fontSize=20.0,
    this.width = double.infinity});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop),
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Set the background color to transparent
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: borderColor)
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: textColor, // Text color
            fontSize: fontSize,
          ),
        ),
      ),
    );

  }




}


