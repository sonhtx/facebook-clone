

import 'package:anti_fb/routes.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextFieldWidget.dart';
import '../../widgets/TextWidget.dart';


class SignupForm4 extends StatelessWidget{
  const SignupForm4({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextWidget(text: "Enter your email", fontSize: 20, textColor: Colors.cyan),
        const TextFieldWidget(labelText: 'Email',  paddingTop: 50.0),
        ButtonWidget(buttonText: 'Next', paddingTop: 10.0, textColor: Colors.white,
            backgroundColor: Colors.cyan,
            onPressed: (){
              final SignupState? signupState = context.findAncestorStateOfType<SignupState>();
              signupState?.moveFoward();
              // TODO: Signup new user
            }),

      ],
    );
  }

}