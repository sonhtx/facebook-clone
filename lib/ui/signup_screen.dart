

import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget{
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: SignupForm(),
          )
      ),

    );
  }


}


class SignupForm extends StatelessWidget{
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(

          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 250.0),
                child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      labelText: 'Email',
                      labelStyle: const TextStyle(fontSize: 14.0),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the value as needed
                      ),

                    )
                ),
              ),
            ],
          ),

        )
    );
  }
}

