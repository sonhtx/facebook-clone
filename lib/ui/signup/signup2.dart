

import 'package:anti_fb/routes.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextFieldWidget.dart';


class SignupForm2 extends StatelessWidget{
  const SignupForm2(this.firstName, this.lastName, {super.key});

  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {

    TextEditingController firstnameController = TextEditingController(text: firstName);
    TextEditingController lastnameController = TextEditingController(text: lastName);

    return Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextWidget(text: "What's your name?", fontSize: 20, textColor: Colors.cyan),
          const TextWidget(text: "Enter the name you use in real life", fontSize: 10, textColor: Colors.grey, paddingTop: 5.0,),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [

                TextFieldWidget(labelText: 'First name', width: 145,
                    paddingRight: 5.0, controller: firstnameController, hintText: 'John',),
                TextFieldWidget(labelText: 'Last name', width: 145,
                    paddingLeft: 5.0, controller: lastnameController, hintText: 'Cena',),

              ],

            ),
          ),

          ButtonWidget(buttonText: 'Next', paddingTop: 10.0, textColor: Colors.white,
              backgroundColor: Colors.cyan,
              onPressed: (){

                final SignupState? signupState = context.findAncestorStateOfType<SignupState>();
                signupState?.signupData.firstName = firstnameController.text;
                signupState?.signupData.lastName = lastnameController.text;

                signupState?.moveFoward();

                // TODO: Signup new user
              }),

        ],
    );
  }

}