import 'package:anti_fb/routes.dart';
import 'package:anti_fb/ui/signup/signup1.dart';
import 'package:anti_fb/ui/signup/signup2.dart';
import 'package:anti_fb/ui/signup/signup3.dart';
import 'package:anti_fb/ui/signup/signup4.dart';
import 'package:anti_fb/ui/signup/signup5.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget{
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupState();

}

class SignupState extends State<SignupScreen>{
  int currentFormIndex = 0;
  Widget screen = const SignupForm1();
  List<Widget> forms = [
    const SignupForm1(),
    const SignupForm2(),
    const SignupForm3(),
    const SignupForm4(),
    const SignupForm5(),
  ];

  void moveFoward() {
    currentFormIndex++;
    setState(() {
      screen = forms[currentFormIndex];
    });
  }
  void navigateBack(){
    currentFormIndex--;
    setState(() {
      screen = forms[currentFormIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Signup'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.grey, // Set the color of the back arrow icon to black
        ),
        leading: currentFormIndex > 0 ? BackButton(
          onPressed: () {
            navigateBack(); // Call the navigateBack method when the back button is pressed
          },
        )
            : null,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: screen,
        )

      )
    );
  }
}