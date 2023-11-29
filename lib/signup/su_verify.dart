import "package:facebook_clone/global/colors.dart";
import "package:flutter/material.dart";
import 'su_routes.dart';
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
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const SignUpVerify(),
    );
  }
}

class SignUpVerify extends StatefulWidget {
  const SignUpVerify({super.key});

  @override
  State<SignUpVerify> createState() => _SignUpVerifyState();
}

class _SignUpVerifyState extends State<SignUpVerify> {
  String email = 'notnullemail@gmail.com';
  int verifyCode = -1;
  int userInput = -2;

  Future<bool> checkVerifyCode(String email, int verifyCode) async {
    final url = Uri.parse('https://it4788.catan.io.vn/check_verify_code');
    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'code_verify': userInput.toString(),
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
        print("Account verified.");
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      email = args['email'];
      verifyCode = args['verifyCode'];
    }

    print(email);
    print("This is your verify code: $verifyCode");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.facebookBlue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/signup/email');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text("Verify your account"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "We've sent a verify code to ",
                  style: const TextStyle(color: Colors.black, fontSize: 18.0),
                  children: <TextSpan>[
                    TextSpan(
                      text: email,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Enter verify code',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    userInput = int.parse(text);
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'FB  -   ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  labelText: 'Enter your verify code',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                onPressed: () async {
                  // Add your onPressed logic here
                  if (await checkVerifyCode(email, userInput)) {
                    // go to log in
                    // ignore: use_build_context_synchronously
                    Navigator.popAndPushNamed(context, 'signup/su_tologin');
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
                child: const Text('Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
