import 'dart:core';

import 'package:anti_fb/constants.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/IconWidget.dart';
import '../../nav_screen.dart';

class FriendScreen extends StatelessWidget{

  const FriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your friends',style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
        backgroundColor: WHITE,
        iconTheme: const IconThemeData( color: GREY,),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // final HomeState? homeState = context.findAncestorStateOfType<HomeState>();
        //     // homeState?.backfromFriend();
        //   },
        // ),
        actions: [ IconWidget(
          icon: Icons.search,
          onPressed: (){Navigator.pushNamed(context, '/search');},
        ) ],
      ),
      body:
      // const SuggestionList()
      SingleChildScrollView(
          child : Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Search Facebook',
                  border: InputBorder.none,
                ),
              ),


            ],
          )
      ),
    );
  }
}