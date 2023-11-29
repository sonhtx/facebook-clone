import 'package:facebook_clone/signup/su_routes.dart';
import "package:flutter/material.dart";
import 'package:facebook_clone/global/colors.dart';

// need to add WebView later

void main() {
  runApp(const SignUpToLogin());
}

class SignUpToLogin extends StatelessWidget {
  const SignUpToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalColor.facebookBlue,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // handle back
                  Navigator.popAndPushNamed(context, '/signup/verify');
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text("Complete Sign Up"),
        ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Congratulation, your account has been created",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(50),
                child: Text(
                  "Click button below to log in and enjoy using our application.",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: ElevatedButton(
                  onPressed: () {
                    // Add your onPressed logic here
                    print("clicked");
                    Navigator.popAndPushNamed(context, '/signup/email');
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(300, 50), // set weight, height of our button
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      GlobalColor.facebookBlue,
                    ),
                  ),
                  child: const Text('To Login page'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
