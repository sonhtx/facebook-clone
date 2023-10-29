

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../models/LoginData.dart';


class LoginApi{

  static Future login(LoginData loginData) async {
    final response = await http.post(
      Uri.parse('$authUrl/login'),
      body: loginData.toJson(),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse; // Signup successful
    } else {
      return false; // Signup failed
    }
  }
}