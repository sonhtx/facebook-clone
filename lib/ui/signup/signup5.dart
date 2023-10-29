

import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/ElevatedButtonWidget.dart';
import '../../widgets/TextWidget.dart';


class SignupForm5 extends StatelessWidget{
  const SignupForm5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextWidget(text: "We sent sms code to ....", fontSize: 14, textColor: GREY),
        const TextWidget(text: "Enter code have 5 digits", fontSize: 14, textColor: GREY),


        Container(
          padding: const EdgeInsets.only(top: 20),
          child: TextField(
            keyboardType: TextInputType.number,
            maxLength: 6, // Set the maximum length to 6
            decoration: InputDecoration(
              labelText: 'Enter 6-Digit Code',
              hintText: '123456',
              hintStyle: TextStyle(
                color: GREY.shade400, // Adjust the color to make it more bland
              ),
            ),
          ),

        ),

        ElevatedButtonWidget(buttonText: 'Confirm', paddingTop: 10.0, textColor: WHITE,
            backgroundColor: CYAN,
            onPressed: (){
              final SignupState? signupState = context.findAncestorStateOfType<SignupState>();
              signupState?.moveFoward();
              // TODO: Signup new user
            }),

        ElevatedButtonWidget(buttonText: "I'm not receive code", paddingTop: 5.0, textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: (){
              Navigator.pushNamed(context, '/signup');
            }),


      ],
    );
  }

}