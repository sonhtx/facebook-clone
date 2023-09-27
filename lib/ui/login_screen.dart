

import 'package:anti_fb/routes.dart';
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
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(15.0),
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

      body: SingleChildScrollView(
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
                      image: AssetImage('assets/images/messi-world-cup.png'), // Specify the asset path
                    ),
                  ),
                ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  labelText: 'Email',
                  labelStyle: const TextStyle(fontSize: 14.0),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                  ),

                )
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 7.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  labelText: 'Password',
                  labelStyle: const TextStyle(fontSize: 14.0),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                  ),

                ),
                obscureText: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 7.0),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, // Set the background color to transparent
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white, // Text color
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                  // TODO: Login the user
                },
              ),
            ),


            Container(
              padding: const EdgeInsets.only(top: 100.0),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set the background color to transparent
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(color: Colors.cyan)
                  ),
                ),
                child: const Text(
                  'Signup new account',
                  style: TextStyle(
                    color: Colors.cyan, // Text color
                  ),
                ),
                onPressed: () {
                  // TODO: Login the user
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

}