
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import '../../../constants.dart';

// const List<Reaction<String>> reaction = [
//   Reaction<String>(
//     value: 'kudos',
//     icon: Icon( Icons.thumb_up, size: 20.0, color: FBBLUE, ),
//   ),
//   Reaction<String>(
//     value: 'dissapoint',
//     icon: Icon( Icons.thumb_down, size: 20.0, color: RED,),
//   ),
// ];

const List<Reaction<String>> reaction = [
  Reaction<String> (
    value: null,
    icon: Icon(Icons.thumb_up, size: 20.0, color: GREY),
  ),
  Reaction<String>(
    value: 'dissapoint',
    icon: Icon( Icons.thumb_down, size: 20.0, color: RED,),
  ),
  Reaction<String>(
    value: 'kudos',
    icon: Icon( Icons.thumb_up, size: 20.0, color: FBBLUE, ),
  ),
];