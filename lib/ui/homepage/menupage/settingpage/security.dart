import 'Change_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:anti_fb/constants.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                            "Security and Login",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
                                builder: (context) => const ChangePassword()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0.0, 20.0),
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
                                child: const Icon(
                                  Icons.key,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: const Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Change your password",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      "You should use a strong password that you haven't used anywhere else",
                                      style: TextStyle(
                                          fontSize: 13.0, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
