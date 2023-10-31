

import 'package:anti_fb/constants/constants.dart';
import 'package:anti_fb/routes.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextFieldWidget.dart';
import '../../widgets/TextWidget.dart';


class SignupForm4 extends StatefulWidget{

  final String email;
  const SignupForm4(this.email, {super.key});

  @override
  State<SignupForm4> createState() => _EmailState();
}

class _EmailState extends State<SignupForm4>{
  late String email;
  late bool visible ;

  @override
  void initState() {
    super.initState();
    visible = false;
    email = widget.email;
  }

  void errorInvalidEmail(){
    setState(() {
      visible = true;
    });
  }

  bool isValidEmail(String email) {
    // Use a regular expression to validate the email format
    // You can customize this regex to suit your validation criteria
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController(text : email);

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextWidget(text: "Enter your email", fontSize: 25, textColor: Colors.black),
        const TextWidget(text: "Enter the email where you can be contacted. "
            "No one will see this on your profile.", fontSize: 14, textColor: Colors.grey,
        paddingTop: 10),
        TextFieldWidget(labelText: 'Email',hintText: 'abc@anonymous.com',  paddingTop: 50.0, controller: emailController,),

        Visibility(
          visible: visible,
          child: const TextWidget(text: "Enter a valid email address", fontSize: 12, textColor: Colors.red,
                paddingTop: 10),

        ),

        ButtonWidget(buttonText: 'Next', paddingTop: 10.0, textColor: Colors.white,
            backgroundColor: Constants.DARK_BLUE,
            onPressed: (){
              if(!isValidEmail(emailController.text)){
                errorInvalidEmail();
              } else {
                final SignupState? signupState = context.findAncestorStateOfType<SignupState>();
                signupState?.signupData.email = emailController.text;

                signupState?.moveFoward();
              }
            }),

      ],
    );
  }
}