

import 'package:anti_fb/models/SignupData.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class SignupApi{

  static Future<bool> signup(SignupData signupData) async {
    final response = await http.post(
      Uri.parse('$authUrl/signup'),
      body: signupData.toJson(),
    );

    if (response.statusCode == 200) {
      return true; // Signup successful
    } else {
      return false; // Signup failed
    }
  }
}