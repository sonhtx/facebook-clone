import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../api/auth/getverifycode_api.dart';
import '../../widgets/AlertDialogWidget.dart';
import '../../widgets/ElevatedButtonWidget.dart';
import '../../widgets/TextWidget.dart';

class SignupForm6 extends StatelessWidget {
  final String email;
  final String verifyCode;

  const SignupForm6(this.email, this.verifyCode, {super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController verifyCodeController = TextEditingController();

    return Scaffold(
        body: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
            text: "We sent sms code to $email", fontSize: 14, textColor: GREY),
        TextWidget(
            text: "Your sms code is $verifyCode",
            fontSize: 14,
            textColor: GREY),
        const TextWidget(
            text: "Enter code have 6 digits", fontSize: 14, textColor: GREY),
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: TextField(
            controller: verifyCodeController,
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
        ElevatedButtonWidget(
            buttonText: 'Confirm',
            paddingTop: 10.0,
            textColor: WHITE,
            backgroundColor: FBBLUE,
            onPressed: () async {
              final getverifycode = await GetVerifyCodeApi.checkVerifyCode(
                  email, verifyCodeController.text);
              if (context.mounted) {
                if (!getverifycode) {
                  showVerifyErrorlNotification(context);
                } else {
                  Navigator.pushNamed(context, '/signupok');
                }
              }
            }),
        ElevatedButtonWidget(
            buttonText: "I'm not receive code",
            paddingTop: 5.0,
            textColor: FBBLUE,
            backgroundColor: WHITE,
            onPressed: () {
              // Navigator.pushNamed(context, '/signup');
            }),
      ],
    ));
  }

  void showVerifyErrorlNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialogWidget(title: 'Error', text: 'Can not verify');
      },
    );
  }
}
