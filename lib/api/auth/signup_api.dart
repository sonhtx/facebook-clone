

import 'dart:convert';

import 'package:anti_fb/models/request/ReqSignupData.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class SignupApi{
  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static Future signup(SignupData signupData) async {

    final String jsonData = jsonEncode(signupData.toJson());

    final response = await http.post(
      Uri.parse('$apiUrl/signup'),
      headers: headers,
      body: jsonData,
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      return false; // Signup failed
    }
  }
}