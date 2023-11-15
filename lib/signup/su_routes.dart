// routes.dart for everything in use case sign up
import 'package:flutter/material.dart';

import 'su_homepage.dart';
import 'su_name.dart';

final Map<String, WidgetBuilder> routes = {
  '/signup/homepage': (context) => const SignUpHomepage(),
  '/signup/name': (context) => const SignUpName(),
  // Add more named routes as needed
};
