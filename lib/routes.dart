import 'package:anti_fb/ui/homepage/friendpage/Friends_page.dart';
import 'package:anti_fb/ui/homepage/nav_screen.dart';
import 'package:anti_fb/ui/homepage/homepage/createpost/createpost_screen.dart';
import 'package:anti_fb/ui/homepage/menupage/personalpage/personal_page.dart';
import 'package:anti_fb/ui/homepage/search/history_search_tab.dart';
import 'package:anti_fb/ui/homepage/search/search_tab.dart';
import 'package:anti_fb/ui/profile/friend_profile.dart';
import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:anti_fb/ui/login/login_screen.dart';

// Define your named routes
final Map<String, WidgetBuilder> routes = {
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => const SignupScreen(),

  '/home': (context) => const HomeScreen(),
  '/post': (context) => const CreatePostScreen(),

  '/search': (context) => SearchTab(),
  '/personal': (context) => const PersonalPage(),
  // '/profile': (context) => ProfileScreen(),
  '/friends': (context) => FriendsPage(),
  // '/messages': (context) => MessagesScreen(),
};

// Optionally, you can define a default route to handle unknown routes
// const String initialRoute = '/login';
const String initialRoute = '/login';
