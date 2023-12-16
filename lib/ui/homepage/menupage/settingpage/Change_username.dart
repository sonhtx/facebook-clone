import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anti_fb/constants.dart';

class ChangeUsername extends StatelessWidget {
  final String name;
  const ChangeUsername({super.key, required this.name});

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Name",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const Divider(),
                ChangeUsernameForm(name: name,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangeUsernameForm extends StatelessWidget {
  final String name;
  const ChangeUsernameForm({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController(text: name);


    return Column(
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Username",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
        TextFieldWidget(controller: userNameController),
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
