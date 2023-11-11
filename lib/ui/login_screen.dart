import 'package:anti_fb/constants/constants.dart';
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
  late bool visible;
  String error = " ";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    visible = false;
  }

  void account_error(message) {
    setState(() {
      visible = true;
      error = message;
    });
  }

  void valid() {
    setState(() {
      visible = false;
      error = " ";
    });
  }

  bool isValidEmail(String email) {
    // Use a regular expression to validate the email format
    // You can customize this regex to suit your validation criteria
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: Constants.defaultPadding,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.00, -1.00),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
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
                    alignment: const AlignmentDirectional(0.00, 1.00),
                    child: SizedBox(
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
                              controller: emailController,
                            ),
                            TextFieldWidget(
                                labelText: 'Password',
                                paddingTop: 7.0,
                                controller: passwordController,
                                obscureText: true),
                            Visibility(
                              visible: visible,
                              child: TextWidget(
                                  text: error,
                                  fontSize: 12,
                                  textColor: Colors.red,
                                  paddingTop: 10),
                            ),
                            ButtonWidget(
                              buttonText: 'Login',
                              paddingTop: 15.0,
                              textColor: Colors.white,
                              backgroundColor: Constants.darkBlue,
                              onPressed: () {
                                if (!isValidEmail(emailController.text)) {
                                  account_error("Enter a valid email adress");
                                } else if(passwordController.text == ""){
                                  account_error("Please enter your password");
                                }else{
                                  valid();
                                }
                              },
                              fontSize: 17.0,
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.black,
                              ),
                              child: const Text('Forgot Password?'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.00, 0.00),
                    child: ButtonWidget(
                      buttonText: 'Signup new account',
                      paddingTop: 5.0,
                      textColor: Constants.darkBlue,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      fontSize: 15.0,
                    ),
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
