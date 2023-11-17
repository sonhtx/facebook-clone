import "package:flutter/material.dart";

void main() {
  runApp(const SignUp());
}

/*
TODOs:
  - create signup homepage 
  - create signup page for firstname and lastname
  - create signup page for birthdate
  - create signup page for confirmation
  - create signup page for email
  - create signup page for verify 
  - routes for signup will be provided inside su_routes.dart folder (the last thing to do in use case sign up)
*/

/*
REMINDERS:
  - create delay when call get_verify_code API
*/

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
