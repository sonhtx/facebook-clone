import 'package:anti_fb/repository/auth/login_repo.dart';
import 'package:anti_fb/widgets/ElevatedButtonWidget.dart';
import 'package:anti_fb/widgets/TextButtonWidget.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/request/ReqLoginData.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: LoginForm(),
      )),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0), //
            child: Container(
              width: 100, // Adjust the width as needed
              height: 100, // Adjust the height as needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/images/messi-world-cup.png'), // Specify the asset path
                ),
              ),
            ),
          ),
          TextFieldWidget(
              labelText: 'Email',
              paddingTop: 50.0,
              controller: emailController),
          TextFieldWidget(
              labelText: 'Password',
              paddingTop: 7.0,
              controller: passwordController,
              obscureText: true),
          ElevatedButtonWidget(
              buttonText: 'Login',
              paddingTop: 7.0,
              textColor: WHITE,
              backgroundColor: FBBLUE,
              onPressed: () async {
                if (emailController.text == '' ||
                    passwordController.text == '') {
                  showNotification(
                      context, 'Error', 'Need to enter email and password');
                  return;
                }
                if (!isValidEmail(emailController.text)) {
                  showNotification(context, 'Error', 'Invalid email address');
                  return;
                }
                LoginData loginData = LoginData(
                  emailController.text,
                  passwordController.text,
                );
                LoginRepository loginRepo = LoginRepository();
                showLoaderDialog(context, "Loading");
                final loginStatus = await loginRepo.login(loginData);

                if (context.mounted) {
                  if (loginStatus) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    showNotification(
                        context, 'Error', 'Wrong email or password');
                    Navigator.pop(context);
                  }
                }
              }),
          TextButtonWidget(
              buttonText: 'Forgot password?',
              paddingTop: 5,
              textColor: BLACK,
              backgroundColor: TRANSPARENT,
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              }),
          ElevatedButtonWidget(
              buttonText: 'Signup new account',
              paddingTop: 100.0,
              textColor: FBBLUE,
              backgroundColor: WHITE,
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              }),
        ],
      ),
    );
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }
}
