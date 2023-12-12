import 'Block.dart';
import 'Notification_Setting.dart';
import 'Personal_Detail.dart';
import 'security.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anti_fb/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: const Text('Next page'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 4.0),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Account Settings",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Manage your information",
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const PersonalDetail()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                              child: const CircleAvatar(
                                  radius:
                                      20.0,
                                  backgroundColor: BTNBG,
                                  child: Icon(
                                      Icons.person,
                                    color: Colors.black,
                                  )),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Personal detail",
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.black),
                                  ),
                                  Text(
                                    'Change username',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const Security()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                              child: const CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: BTNBG,
                                  child: Icon(Icons.security,color: Colors.black,)),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Security",
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.black),
                                  ),
                                  Text(
                                    'Change your password',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 4.0),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Privacy",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Manage your block list and notification",
                              style:
                                  TextStyle(fontSize: 13.0, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const BlockScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                              child: const CircleAvatar(
                                  radius: 20.0,
                                  backgroundColor: BTNBG,
                                  child: Icon(Icons.block,color: Colors.black,)),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Block",
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.black),
                                  ),
                                  Text(
                                    'Your block list',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>
                                  const NotificationSetting()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                        shape: const BeveledRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                              child: const CircleAvatar(
                                  radius:20.0,
                                  backgroundColor: BTNBG,
                                  child: Icon(Icons.notifications,color: Colors.black,)),
                            ),
                            const Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notification",
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.black),
                                  ),
                                  Text(
                                    'Notification settings',
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
