

import 'package:anti_fb/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget{
  final String labelText;
  final double width ;
  final double paddingTop;
  final double paddingBottom;
  final double paddingRight;
  final double paddingLeft;
  final String hintText;
  final bool obscureText;


  final TextEditingController controller ;

  const TextFieldWidget({super.key, this.labelText = '', this.width = double.infinity,
                          this.paddingTop = 0, this.paddingBottom = 0,
                          this.paddingRight = 0, this.paddingLeft = 0,
                          required this.controller, this.hintText = '',
                          this.obscureText = false});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: paddingTop, left: paddingLeft, right: paddingRight, bottom: paddingBottom ),
      width: width,
      child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            labelText: labelText,
            hintText : hintText,
            hintStyle: TextStyle(
              color: GREY.shade400, // Adjust the color to make it more bland
            ),
            labelStyle: const TextStyle(fontSize: 14.0),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust t
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: FBBLUE,
                width: 2.0, // Adjust the width as needed for the desired thickness
              ),
            ),

          ),

          controller: controller,
          obscureText: obscureText,
      ),
    );

  }

}