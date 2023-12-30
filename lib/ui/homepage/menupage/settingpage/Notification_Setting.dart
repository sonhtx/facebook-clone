import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Notification Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 4.0),
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Facebook may still send you important notifications about your account and content outside of your preferred notification settings",
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  )),
              const SizedBox(height: 10.0),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "What Notifications You Receive",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
