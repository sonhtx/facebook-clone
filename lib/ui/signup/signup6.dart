

import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextFieldWidget.dart';
import '../../widgets/TextWidget.dart';


class SignupForm6 extends StatefulWidget {

  const SignupForm6({super.key});

  @override
  State<SignupForm6> createState() => _PasswordState();

}
class _PasswordState extends State<SignupForm6>{

  late bool visible ;

  @override
  void initState() {
    super.initState();
    visible = false;
  }

  void setPasswordNotMatchState(){
    setState(() {
      visible = true;
    });
  }

  bool isPasswordMatch(String pw, String repw){
    if(pw == repw){
      return true;
    }
    return false;
  }

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

        Visibility(
          visible: visible,
          child: const TextWidget(text: "Password not match", fontSize: 12, textColor: Colors.red,
              paddingTop: 10),
        ),

        ButtonWidget(buttonText: 'Next', paddingTop: 10.0, textColor: Colors.white,
            backgroundColor: Colors.cyan,
            onPressed: (){
              if(!isPasswordMatch(pw.text, repw.text)){
                setPasswordNotMatchState();
              } else {
                final SignupState? signupState = context.findAncestorStateOfType<SignupState>();
                signupState?.signupData.password = pw.text;

                // send signup information to backend
                // redirect to signup7 if receive OK response
                // use await async for waiting response

                Navigator.pushNamed(context, '/signup7');

              }
            }),
      ],
    );
  }


}