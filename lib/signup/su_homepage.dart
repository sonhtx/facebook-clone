import 'package:facebook_clone/signup/su_routes.dart';
import "package:flutter/material.dart";
import 'package:facebook_clone/global/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: const SignUpHomepage(),
    );
  }
}

class SignUpHomepage extends StatefulWidget {
  const SignUpHomepage({super.key});

  @override
  State<SignUpHomepage> createState() => _SignUpHomepageState();
}

class _SignUpHomepageState extends State<SignUpHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.facebookBlue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                // handle back
                Navigator.popAndPushNamed(context, '/signup/name');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text("Create a new account"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 100.0,
                bottom: 60.0,
                left: 40,
                right: 40,
              ), // Add padding to the first child
              child: Image(
                image: AssetImage('images/signup.jpg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Join Facebook",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
            ),
            const Text(
              "We'll help you to create a new facebook account easily.",
              style: TextStyle(
                fontSize: 16.0, // Change the font size as per your requirement
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                  Navigator.popAndPushNamed(context, '/signup/name');
                  print("clicked");
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(300, 50), // set weight, height of our button
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    GlobalColor.facebookBlue,
                  ),
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
