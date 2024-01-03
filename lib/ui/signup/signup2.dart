import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/ElevatedButtonWidget.dart';
import '../../widgets/TextFieldWidget.dart';

class SignupForm2 extends StatefulWidget {
  const SignupForm2(this.firstName, this.lastName, {super.key});

  final String firstName;
  final String lastName;

  @override
  State<SignupForm2> createState() => _NameState();
}

class _NameState extends State<SignupForm2> {
  late String firstName;
  late String lastName;
  late bool visible;

  @override
  void initState() {
    super.initState();
    visible = false;
    firstName = widget.firstName;
    lastName = widget.lastName;
  }

  void errorEmptyName() {
    setState(() {
      visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController firstnameController =
        TextEditingController(text: firstName);
    TextEditingController lastnameController =
        TextEditingController(text: lastName);

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextWidget(
            text: "What's your name?", fontSize: 20, textColor: FBBLUE),
        const TextWidget(
          text: "Enter the name you use in real life",
          fontSize: 10,
          textColor: GREY,
          paddingTop: 5.0,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            children: [
              TextFieldWidget(
                labelText: 'First name',
                width: 145,
                paddingRight: 5.0,
                controller: firstnameController,
                hintText: 'John',
              ),
              TextFieldWidget(
                labelText: 'Last name',
                width: 145,
                paddingLeft: 5.0,
                controller: lastnameController,
                hintText: 'Cena',
              ),
            ],
          ),
        ),
        Visibility(
          visible: visible,
          child: const TextWidget(
              text: "Provide your name",
              fontSize: 12,
              textColor: RED,
              paddingTop: 10),
        ),
        ElevatedButtonWidget(
            buttonText: 'Next',
            paddingTop: 10.0,
            textColor: WHITE,
            backgroundColor: FBBLUE,
            onPressed: () {
              if (firstnameController.text == '' ||
                  lastnameController.text == '') {
                errorEmptyName();
              } else {
                final SignupState? signupState =
                    context.findAncestorStateOfType<SignupState>();
                signupState?.signupData.firstName = firstnameController.text;
                signupState?.signupData.lastName = lastnameController.text;

                signupState?.moveFoward();
              }
            }),
      ],
    );
  }
}
