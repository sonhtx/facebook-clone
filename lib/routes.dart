

import 'dart:js';

import 'package:anti_fb/ui/homepage/friendpage/friendlist/friends_tab.dart';
import 'package:anti_fb/ui/homepage/home_screen.dart';
import 'package:anti_fb/ui/homepage/homepage/createpost/createpost_screen.dart';
import 'package:anti_fb/ui/homepage/menupage/personalpage/personal_page.dart';
import 'package:anti_fb/ui/homepage/search/history_search_tab.dart';
import 'package:anti_fb/ui/homepage/search/search_tab.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:anti_fb/ui/login/login_screen.dart';

// Define your named routes
final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),

  '/home' : (context) => const HomeScreen(),
  '/post' : (context) => const CreatePostScreen(),

  '/search' :(context) => const SearchTab(),
  '/personal' :(context) => const PersonalPage(),
  '/history_search' : (context) => const HistorySearchTab(),
  '/friend' : (context) => const FriendsTab(),

  // '/profile': (context) => ProfileScreen(),
  // '/friends': (context) => FriendsScreen(),
  // '/messages': (context) => MessagesScreen(),
};

// Optionally, you can define a default route to handle unknown routes
const String initialRoute = '/home';
