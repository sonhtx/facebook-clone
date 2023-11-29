import "package:facebook_clone/global/colors.dart";
import "package:flutter/material.dart";
import "package:facebook_clone/signup/su_routes.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: GlobalColor.facebookBlue,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/signup/confirmation');
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text('Log In'),
        ),
        body: const LogInForm(),
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  String email = '';
  String password = '';
  // final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;

  Future<bool> logIn(String email, String password) async {
    print(email);
    print(password);
    final url = Uri.parse('https://it4788.catan.io.vn/login');

    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
          'uuid': 'uuid',
        },
      );

      Map<String, dynamic> rp = json.decode(response.body);
      // print(rp);
      int code = int.parse(rp["code"]);
      // String message = rp["message"];
      // print(message);

      // Map<String, dynamic> data = rp["data"];
      // validate input here
      // print(message);

      print(code);

      if (code == 1000) {
        // verify account
        print("to homepage");
        return true;
        // move to the next page
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 70.0,
                bottom: 60.0,
                left: 40,
                right: 40,
              ), // Add padding to the first child
              child: Image(
                image: AssetImage('images/fb_icon.jpg'),
                width: 50,
                height: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Enter your email and password",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (text) {
                  // This callback is called whenever the text changes
                  setState(() {
                    email = text; // Update the enteredText variable
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: TextField(
                // controller: _passwordController,
                onChanged: (text) {
                  // This callback is called whenever the text changes
                  setState(() {
                    password = text; // Update the enteredText variable
                  });
                },
                obscureText: obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      !obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // Toggle visibility of the password
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () async {
                  // add logic here
                  print('Pressed');
                  if (await logIn(email, password)) {
                    // go in
                  }
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(500, 50), // set weight, height of our button
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    GlobalColor.facebookBlue,
                  ),
                ),
                child: const Text('Log In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
