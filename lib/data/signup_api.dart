

import 'package:anti_fb/models/SignupData.dart';
import 'package:http/http.dart' as http;

class SignupApi{

  static const String baseUrl = "http://localhost:2400/api/auth";

  static Future<bool> sendSignupInfor(SignupData signupData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      body: signupData.toJson(),
    );

    if (response.statusCode == 200) {
      return true; // Signup successful
    } else {
      return false; // Signup failed
    }
  }
}