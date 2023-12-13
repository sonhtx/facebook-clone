
import 'dart:core';

import 'package:anti_fb/constants.dart';
import 'package:anti_fb/ui/homepage/friendpage/suggestionpage/suggestion_list.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/IconWidget.dart';
import '../../nav_screen.dart';

class SuggestionScreen extends StatelessWidget{

  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggestions',style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
        backgroundColor: WHITE,
        iconTheme: const IconThemeData( color: GREY,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final HomeState? homeState = context.findAncestorStateOfType<HomeState>();
            homeState?.backfromSuggestion();
          },
        ),
        actions: [ IconWidget(
          icon: Icons.search,
          onPressed: (){Navigator.pushNamed(context, '/search');},
        ) ],
      ),
      body:
      // const SuggestionList()
      SingleChildScrollView(
        child : SuggestionList()
      ),
    );
  }
}