



import 'package:flutter/material.dart';

import '../constants.dart';

class TextButtonWidget extends StatelessWidget{
  final String buttonText;
  final double paddingTop;
  final Color textColor;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const TextButtonWidget({super.key, required this.buttonText, required this.paddingTop, required this.textColor,
    required this.backgroundColor, this.borderColor = CYAN, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
        ),
        child: Text(buttonText),
        onPressed: () {},
      ),
    );

  }




}


