

import 'package:anti_fb/constants/constants.dart';
import 'package:anti_fb/routes.dart';
import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // bool isLoading = false;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: Constants.defaultPadding,

          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/fb_logo.png',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00,1.00),
                    child: Container(
                      width: double.infinity,
                      // height: 200,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                          TextFieldWidget(
                            labelText: 'Email',
                            paddingTop: 15.0,
                            controller: emailController),
                          TextFieldWidget(
                            labelText: 'Password',
                            paddingTop: 7.0,
                            controller: passwordController,
                            obscureText: true),

                          ButtonWidget(buttonText: 'Login', paddingTop: 15.0, textColor: Colors.white,
                            backgroundColor: Constants.DARK_BLUE,
                            onPressed: (){

                            },
                            fontSize: 17.0,),
                            TextButton(
                              onPressed: () {

                              },
                              child: const Text('Forgot Password?'),
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.00, 0.00),
                    child: ButtonWidget(
                      buttonText: 'Signup new account',
                      paddingTop: 5.0,
                      textColor: Constants.DARK_BLUE,
                      backgroundColor: Colors.white,
                      onPressed: (){
                        Navigator.pushNamed(context, '/signup');
                        },
                      fontSize: 15.0,),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
