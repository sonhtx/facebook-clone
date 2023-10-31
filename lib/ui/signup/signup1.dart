

import 'package:anti_fb/constants/constants.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../widgets/ButtonWidget.dart';

class SignupForm1 extends StatelessWidget{
  const SignupForm1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(

        children: [

          ButtonWidget(buttonText: 'Get started', paddingTop: 100.0, textColor: Colors.white,
              backgroundColor: Constants.DARK_BLUE,
              onPressed: (){
                final SignupState? signupState = context.findAncestorStateOfType<SignupState>();
                signupState?.moveFoward();
                // TODO: Signup new user
              }),

          ButtonWidget(buttonText: 'I already have an account', paddingTop: 0.0, textColor: Colors.black87,
              backgroundColor: Colors.white,
              onPressed: (){
                Navigator.pushNamed(context, '/login');
                // TODO: Signup new user
              }),



        ],
    );
  }

}