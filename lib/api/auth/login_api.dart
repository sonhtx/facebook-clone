

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../models/request/ReqLoginData.dart';


class LoginApi{
  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static Future login(LoginData loginData) async {

    final String jsonData = jsonEncode(loginData.toJson());
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: headers,
      body: jsonData,
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse; // Login successful
    } else {
      return false; // Login failed
    }
  }
}