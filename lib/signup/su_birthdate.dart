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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: const SignUpBirthdate(),
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
  List<String> notis = [];

  bool ageRestrict(DateTime birthdate) {
    final now = DateTime.now();
    if (now.year - birthdate.year < 18) return true;
    return false;
  }

  void addNoti(String notification) {
    setState(() {
      notis.clear();
      notis.add(notification);
    });
  }

  void ageRestrictNotification() {
    addNoti("You must be >= 18 years old to sign up.");
  }

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
                    if (ageRestrict(_selectedDate)) {
                      ageRestrictNotification();
                    } else {
                      notis.clear();
                    }
                  });
                },
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
              padding: const EdgeInsets.all(40),
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                  Navigator.pushNamed(context, '/signup/confirmation');
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
