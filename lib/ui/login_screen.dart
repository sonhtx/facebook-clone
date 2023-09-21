

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: LoginForm(),
          )
      ),

    );
  }

}

class LoginForm extends StatelessWidget{
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              )
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                ),
              obscureText: true,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16.0), // Adjust the right margin for spacing
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      // TODO: Login the user
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16.0), // Adjust the left margin for spacing
                  child: ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      // TODO: Sign up the user
                    },
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }

}