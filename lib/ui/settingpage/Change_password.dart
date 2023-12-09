import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextFieldWidget.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bg,
      appBar: AppBar(
        backgroundColor: Colors.white ,
        title: const Text('Change Password'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                ChangePasswordForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController newPasswordAgainController = TextEditingController();

    return Column(
      children: [
        TextFieldWidget(
            controller: currentPasswordController,
            hintText : "Current Password",
          obscureText: true,
        ),
        TextFieldWidget(
          controller: newPasswordController,
          hintText : "New Password",
          obscureText: true,
        ),
        TextFieldWidget(
          controller: newPasswordAgainController,
          hintText : "New Password Again  ",
          obscureText: true,
        ),
        const SizedBox(height: 15.0),
        ButtonWidget(
          buttonText: "Save",
          paddingTop: 10.0,
          textColor: Colors.white,
          backgroundColor: Constants.facebookBlue,
          onPressed: (){
            Navigator.pop(context);
          },
          radius: 10.0,
          fontSize: 15.0,
        ),
        ButtonWidget(
          buttonText: "Cancel",
          paddingTop: 10.0,
          textColor: Colors.black,
          backgroundColor: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
          radius: 10.0,
          fontSize: 15.0,
          borderColor: Colors.black,
        ),
        TextButton(
            onPressed: (){},
            child: const Text(
              "Forgot password?",
              style: TextStyle(
                color: Constants.facebookBlue,
                fontSize: 13.0
              ),
            ))
      ],
    );
  }
}
