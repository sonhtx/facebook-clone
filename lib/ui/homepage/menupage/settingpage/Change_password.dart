import 'package:anti_fb/models/request/ReqPasswordChange.dart';
import 'package:anti_fb/repository/setting/change_password_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anti_fb/constants.dart';
import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              children: [ChangePasswordForm()],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();
  late String error;
  // bool? status;

  @override
  void initState() {
    super.initState();
    error = "";
  }

  bool CheckPasswordEmpty(){
    return currentPasswordController.text.isEmpty || newPasswordController.text.isEmpty || newPasswordAgainController.text.isEmpty;
  }

  bool CheckReEnterPassword(){
    return newPasswordAgainController.text != newPasswordController.text;
  }

  Future setResult(bool status) async{
    if(status){
      showDialog(
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 10), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: Text('Change password successfully'),
            );
          });
      Navigator.pop(context);
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        TextFieldWidget(
          controller: currentPasswordController,
          hintText: "Current Password",
          obscureText: true,
        ),
        const SizedBox(height: 15.0),
        TextFieldWidget(
          controller: newPasswordController,
          hintText: "New Password",
          obscureText: true,
        ),
        const SizedBox(height: 15.0),
        TextFieldWidget(
          controller: newPasswordAgainController,
          hintText: "Re-type new password  ",
          obscureText: true,
        ),
        const SizedBox(height: 5.0),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            error,
            style: const TextStyle(
              color: Colors.red
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        ButtonWidget(
          buttonText: "Save",
          paddingTop: 10.0,
          textColor: Colors.white,
          backgroundColor: FBBLUE,
          onPressed: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if(CheckPasswordEmpty()){
              setState(() {
                error = "Password must not empty";
              });
            }else if(CheckReEnterPassword()){
              setState(() {
                error = "New password does not match";
              });
            }else{
              ReqChangePassword reqChangePassword = ReqChangePassword(currentPasswordController.text, newPasswordAgainController.text);
              ChangePasswordRepository changePasswordRepo = ChangePasswordRepository();
              changePasswordRepo.changePassword(reqChangePassword)
                  .then((status) {
                if(status){
                  const snackBar = SnackBar(
                    content: Text('Change password successfully'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                }else{
                  setState(() {
                    error = "Password is not correct";
                  });
                }
              }).catchError((error) {
              });
            }

          },
          radius: 10.0,
          fontSize: 15.0,
        ),
        ButtonWidget(
          buttonText: "Cancel",
          paddingTop: 10.0,
          textColor: Colors.black,
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          radius: 10.0,
          fontSize: 15.0,
          borderColor: Colors.black,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Forgot password?",
              style: TextStyle(color: FBBLUE, fontSize: 13.0),
            ))
      ],
    );
  }
}
