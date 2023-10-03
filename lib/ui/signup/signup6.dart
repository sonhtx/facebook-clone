

import 'package:anti_fb/routes.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextFieldWidget.dart';
import '../../widgets/TextWidget.dart';


class SignupForm6 extends StatelessWidget{

  const SignupForm6({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController pw = TextEditingController();
    TextEditingController repw = TextEditingController();


    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextWidget(text: "Setup your password", fontSize: 20, textColor: Colors.cyan),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            children: [
              const TextWidget(text: "Enter your password", width : 145, fontSize: 12, textColor: Colors.grey),
              TextFieldWidget(width : 145, controller: pw, obscureText: true,)
            ],
          )
          
        ),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                const TextWidget(text: "Re-Enter your password", width : 145, fontSize: 12, textColor: Colors.grey),
                TextFieldWidget(width : 145, controller: repw, obscureText: true,)
              ],
            )

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