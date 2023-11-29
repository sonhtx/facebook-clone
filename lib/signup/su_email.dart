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
      home: const SignUpEmail(),
    );
  }
}

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({super.key});

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  String email = '';
  String password = '';
  int verifyCode = -1;
  List<String> notis = [];
  // final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;

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
                Navigator.popAndPushNamed(context, '/signup/confirmation');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text("Email"),
      ),
      body: Center(
        child: Column(
          children: [
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
            for (var text in notis)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
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
              padding: const EdgeInsets.all(16.0),
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
                  // print('Before fetching, your email is ${password}');
                  if (validate(email, password)) {
                    if (await signUp()) {
                      await verifyAccount(email);
                      // print(verifyCode);
                      // ignore: use_build_context_synchronously
                      Navigator.pushNamed(
                        context,
                        '/signup/verify',
                        arguments: {'email': email, 'verifyCode': verifyCode},
                      );
                    }
                  }
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

  void clearNoti() {
    setState(() {
      notis.clear();
    });
  }

  void addNoti(String notification) {
    setState(() {
      notis.clear();
      notis.add(notification);
    });
  }

  void wrongEmailFormatNotification() {
    addNoti("Email must be in correct form.");
  }

  void wrongPasswordFormatNotification() {
    if (password.length < 6 || password.length > 10) {
      addNoti('Password must contains 6 to 10 characters.');
    } else {
      addNoti('Password must contains only characters and numbers.');
    }
  }

  bool validate(String email, String password) {
    // check the email format
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(email)) {
      wrongEmailFormatNotification();
      return false;
    }
    // check the password format
    final passwordRegex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!passwordRegex.hasMatch(password)) {
      wrongPasswordFormatNotification();
      return false;
    }
    // check the password's length
    if (password.length < 6 || password.length > 10) {
      wrongPasswordFormatNotification();
      return false;
    }
    clearNoti();
    return true;
  }

  Future<void> verifyAccount(String email) async {
    final Uri url = Uri.parse(
      'https://it4788.catan.io.vn/get_verify_code',
    );

    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
        },
      );

      Map<String, dynamic> rp = json.decode(response.body);
      print(rp);
      int code = int.parse(rp["code"]);
      String message = rp["message"];
      verifyCode = int.parse(rp["data"]["verify_code"]);
      print(verifyCode);

      // Map<String, dynamic> data = rp["data"];
      // validate input here
      // print(message);
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  Future<bool> signUp() async {
    final url = Uri.parse('https://it4788.catan.io.vn/signup');

    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
          'uuid': "uuiidd",
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

      // print(code);

      if (code == 1000) {
        // verify account
        print("go to verify account");
        return true;
        // move to the next page
      } else if (code == 9996) {
        // user existed
        addNoti("This email has been used by another account.");
        print(email);
        return false;
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
      return false;
    }
    return false;
  }
}
