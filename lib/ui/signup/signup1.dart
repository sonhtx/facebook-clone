

import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/ElevatedButtonWidget.dart';

class SignupForm1 extends StatelessWidget{
  const SignupForm1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          ElevatedButtonWidget(buttonText: 'Get started', paddingTop: 100.0, textColor: WHITE,
              backgroundColor: FBBLUE,
              onPressed: (){
                final SignupState? signupState = context.findAncestorStateOfType<SignupState>();
                signupState?.moveFoward();
              }),

          ElevatedButtonWidget(buttonText: 'I already have an account', paddingTop: 0.0, textColor: FBBLUE,
              backgroundColor: WHITE,
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              }),
        ],
    );
  }

}