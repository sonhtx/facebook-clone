import "package:facebook_clone/global/colors.dart";
import "package:flutter/material.dart";
import "package:facebook_clone/signup/su_routes.dart";
import 'package:scroll_date_picker/scroll_date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpBirthdate(),
    );
  }
}

class SignUpBirthdate extends StatefulWidget {
  const SignUpBirthdate({super.key});

  @override
  State<SignUpBirthdate> createState() => _SignUpBirthdateState();
}

class _SignUpBirthdateState extends State<SignUpBirthdate> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/signup/name');
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text("Birthdate"),
        ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "When's your birthday?",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ScrollDatePicker(
                  selectedDate: _selectedDate,
                  locale: const Locale('en'),
                  onDateTimeChanged: (DateTime value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
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
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
