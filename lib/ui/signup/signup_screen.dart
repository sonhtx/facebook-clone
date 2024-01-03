import 'package:anti_fb/models/request/ReqSignupData.dart';
import 'package:anti_fb/ui/signup/signup1.dart';
import 'package:anti_fb/ui/signup/signup4.dart';
import 'package:anti_fb/ui/signup/signup5.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => SignupState();
}

class SignupState extends State<SignupScreen> {
  late SignupData signupData;
  late int currentFormIndex;
  late Widget screen;

  void moveToScreen1() {
    setState(() {
      screen = const SignupForm1();
    });
  }

  // void moveToScreen2(){ setState(() {screen = SignupForm2(signupData.firstName, signupData.lastName);});}
  // void moveToScreen3(){ setState(() {screen = SignupForm3(signupData.birthday);});}
  void moveToScreen4() {
    setState(() {
      screen = SignupForm4(signupData.email);
    });
  }

  void moveToScreen5() {
    setState(() {
      screen = const SignupForm5();
    });
  }

  List<void Function()> moveScreen = [];

  @override
  void initState() {
    super.initState();

    signupData = SignupData("", "", "", DateTime(2010, 10, 26), "");

    currentFormIndex = 0;
    screen = const SignupForm1();

    moveScreen = [
      moveToScreen1,
      moveToScreen4,
      moveToScreen5,
    ];
  }

  void moveFoward() {
    currentFormIndex++;
    moveScreen[currentFormIndex]();
  }

  void navigateBack() {
    currentFormIndex--;
    moveScreen[currentFormIndex]();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // title: const Text('Signup'),
          backgroundColor: TRANSPARENT,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: GREY, // Set the color of the back arrow icon to black
          ),
          leading: currentFormIndex > 0
              ? BackButton(
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
        )));
  }
}
