import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class NotificationSetting extends StatelessWidget {
  const NotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bg,
      appBar: AppBar(
        backgroundColor: Colors.white ,
        title: const Text("Notification Setting"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 4.0),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: const Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Blocked People",
                      style: TextStyle(
                          fontSize: 20.0
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Manage your information",
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.grey
                      ),
                    ),
                  ),

                ],
            )
            )],
        ),
      ),
    );
  }
}
