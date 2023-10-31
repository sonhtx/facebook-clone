// import 'dart:js';
import 'package:anti_fb/ui/homepage/home_screen.dart';
import 'package:anti_fb/ui/homepage/nav_screen.dart';
import 'package:anti_fb/ui/signup/signup3.dart';
import 'package:anti_fb/ui/signup/signup4.dart';
import 'package:anti_fb/ui/signup/signup5.dart';
import 'package:anti_fb/ui/signup/signup7.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:anti_fb/ui/signup/signup1.dart';
import 'package:anti_fb/ui/signup/signup2.dart';
import 'package:flutter/material.dart';
import 'package:anti_fb/ui/login_screen.dart';

// Define your named routes
final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginScreen(),

  '/signup': (context) => const SignupScreen(),
  '/signup7': (context) => const SignupForm7(),


  '/home': (context) => HomeScreen(),
  '/nav': (context) => NavScreen(),
  // '/profile': (context) => ProfileScreen(),
  // '/friends': (context) => FriendsScreen(),
  // '/messages': (context) => MessagesScreen(),
};

// Optionally, you can define a default route to handle unknown routes
const String initialRoute = '/nav';
