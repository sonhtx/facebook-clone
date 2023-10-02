



import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  final String buttonText;
  final double paddingTop;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const ButtonWidget({super.key, required this.buttonText, required this.paddingTop, required this.textColor, required this.backgroundColor, this.borderColor = Colors.cyan, required this.onPressed});


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


