import "package:facebook_clone/global/colors.dart";
import "package:flutter/material.dart";
import 'su_routes.dart';

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
      home: const SignUpVerfify(),
    );
  }
}

class SignUpVerfify extends StatefulWidget {
  const SignUpVerfify({super.key});

  @override
  State<SignUpVerfify> createState() => _SignUpVerfifyState();
}

class _SignUpVerfifyState extends State<SignUpVerfify> {
  String email = 'notnullemail@gmail.com';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      email = args['email'];
    }

    print(email);
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
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
              child: TextField(
                decoration: InputDecoration(
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
                onPressed: () {
                  // Add your onPressed logic here
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
