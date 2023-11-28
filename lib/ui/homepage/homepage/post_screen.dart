
import 'dart:core';

import 'package:anti_fb/constants.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget{
  String email;
  String avatarUrl;
  String time;
  List<String> imageUrl;

  PostScreen({super.key, required this.email, required this.avatarUrl, required this.time, required this.imageUrl});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GREEN,
      ),
      body: Column(
        children: [



        ],
      )

    );
  }
}