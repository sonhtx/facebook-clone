
import 'package:flutter/material.dart';

import '../constants.dart';

class TextWidget extends StatelessWidget{
  final String text;
  final double width;
  final double fontSize;
  final Color textColor;
  final TextAlign textAlign;
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final double paddingLeft;
  final FontWeight fontWeight;

  const TextWidget({super.key, required this.text, required this.fontSize,
                    this.textColor = BLACK, this.textAlign = TextAlign.left,
                    this.paddingTop = 0, this.paddingBottom = 0,
                    this.paddingRight = 0, this.paddingLeft = 0,
                    this.width = double.infinity,
                    this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        padding: EdgeInsets.only(top: paddingTop, left: paddingLeft, right: paddingRight, bottom: paddingBottom ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize, // Text font size
            fontWeight: fontWeight, // Text font weight
            color: textColor, // Text color
          ),
          textAlign: textAlign, // Align text to the left
        )
    );
  }
  
  
  
  
  
  
  
}