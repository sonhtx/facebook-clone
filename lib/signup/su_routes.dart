// routes.dart for everything in use case sign up
import 'package:facebook_clone/signup/su_confirmation.dart';
import 'package:facebook_clone/signup/su_name.dart';
import 'package:facebook_clone/signup/su_verify.dart';

import 'package:flutter/material.dart';

import 'su_homepage.dart';
import 'su_birthdate.dart';
import 'su_email.dart';

final Map<String, WidgetBuilder> routes = {
  '/signup/homepage': (context) => const SignUpHomepage(),
  '/signup/name': (context) => const SignUpName(),
  '/signup/birthdate': (context) => const SignUpBirthdate(),
  '/signup/confirmation': (context) => const SignUpConfirmation(),
  '/signup/email': (context) => const SignUpEmail(),
  '/signup/verify': (contest) => const SignUpVerfify(),

  // Add more named routes as needed
};
