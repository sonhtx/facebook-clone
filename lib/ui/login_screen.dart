

import 'package:anti_fb/routes.dart';
import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:anti_fb/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      // ),
      // resizeToAvoidBottomInset: false,
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
    return SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Padding(
            //     padding: const EdgeInsets.only(top: 100.0), //
            //     child: Container(
            //       width: 100, // Adjust the width as needed
            //       height: 100, // Adjust the height as needed
            //       decoration: const BoxDecoration(
            //         shape: BoxShape.circle,
            //         image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: AssetImage('assets/images/messi-world-cup.png'), // Specify the asset path
            //         ),
            //       ),
            //     ),
            // ),

            const TextFieldWidget(labelText: 'Email',  paddingTop: 50.0),
            const TextFieldWidget(labelText: 'Email',  paddingTop: 7.0),

            ButtonWidget(buttonText: 'Login', paddingTop: 7.0, textColor: Colors.white,
                backgroundColor: Colors.cyan,
                onPressed: (){

                }),

            ButtonWidget(buttonText: 'Signup new account', paddingTop: 100.0, textColor: Colors.cyan,
                backgroundColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, '/signup');
                }),

          ],
        ),
    );
  }

}