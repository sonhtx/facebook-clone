

import 'package:anti_fb/ui/signup/signup3.dart';
import 'package:anti_fb/ui/signup/signup4.dart';
import 'package:anti_fb/ui/signup/signup5.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:anti_fb/ui/signup/signup1.dart';
import 'package:anti_fb/ui/signup/signup2.dart';
import 'package:flutter/material.dart';
import 'package:anti_fb/ui/login_screen.dart';

// Define your named routes
final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginScreen(),

  '/signup': (context) => const SignupScreen(),
  '/signup1': (context) => const SignupForm1(),
  '/signup2': (context) => const SignupForm2(),
  '/signup3': (context) => const SignupForm3(),
  '/signup4': (context) => const SignupForm4(),
  '/signup5': (context) => const SignupForm5(),


  // '/home': (context) => HomeScreen(),
  // '/profile': (context) => ProfileScreen(),
  // '/friends': (context) => FriendsScreen(),
  // '/messages': (context) => MessagesScreen(),
};

// Optionally, you can define a default route to handle unknown routes
const String initialRoute = '/login';
