import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anti_fb/constants.dart';

class ChangeUsername extends StatelessWidget {
  const ChangeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Name'),
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Name",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                Divider(),
                ChangeUsernameForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangeUsernameForm extends StatelessWidget {
  const ChangeUsernameForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController middleNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "First Name",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        TextFieldWidget(controller: firstNameController),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Middle Name",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        TextFieldWidget(controller: middleNameController),
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Last Name",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        TextFieldWidget(controller: lastNameController),
        const SizedBox(height: 8.0),
        Container(
          margin: const EdgeInsets.all(1.0),
          color: BG,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
              text: const TextSpan(
                  text: "Please note that: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                  children: [
                    TextSpan(
                        text:
                            ": If you change your name on Facebook, your Name cannot be changed for 60 days. Don't add any unusual capitalization, punctuation, characters, or random words. ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal))
                  ]),
            ),
          ),
        ),
        const SizedBox(height: 15.0),
        ButtonWidget(
          buttonText: "Save",
          paddingTop: 10.0,
          textColor: Colors.white,
          backgroundColor: FBBLUE,
          onPressed: () {
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
          onPressed: () {
            Navigator.pop(context);
          },
          radius: 10.0,
          fontSize: 15.0,
          borderColor: Colors.black,
        )
      ],
    );
  }
}
