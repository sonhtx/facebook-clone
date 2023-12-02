
import 'dart:core';

import 'package:anti_fb/constants.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget{
  final String id ;

  const PostScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        title: const Text('Post',style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
        iconTheme: const IconThemeData(
          color: GREY, // Set the color of the back arrow icon to black
        ),
      ),
      body: Column(
        children: [



        ],
      ),
      bottomNavigationBar: Container(
        color: GREEN,
        height: 50,
        child: const TextWidget(text: '555', fontSize: 12,),
      ),
    
    );
  }
}