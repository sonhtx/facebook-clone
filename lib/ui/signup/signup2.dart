

import 'package:anti_fb/routes.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextFieldWidget.dart';


class SignupForm2 extends StatelessWidget{
  const SignupForm2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextWidget(text: "What's your name?", fontSize: 20, textColor: Colors.cyan),
          const TextWidget(text: "Enter the name you use in real life", fontSize: 10, textColor: Colors.grey, paddingTop: 5.0,),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15.0),
            child: const Row(
              children: [

                TextFieldWidget(labelText: 'First name',width: 145,  paddingRight: 5.0),
                TextFieldWidget(labelText: 'Last name',width: 145,  paddingLeft: 5.0),

              ],

            ),
          ),

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