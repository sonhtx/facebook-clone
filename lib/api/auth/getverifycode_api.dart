

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../constants.dart';

class GetVerifyCodeApi{
  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static Future getVerifyCode(String email) async {

    final response = await http.post(
      Uri.parse('$apiUrl/get_verify_code'),
      headers: headers,
      body: {"email" : email},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      return false; // Email not exist
    }
  }

  static Future<bool> checkVerifyCode(String email, String code) async {
    final response = await http.post(
      Uri.parse('$apiUrl/check_verify_code'),
      headers: headers,
      body: {"email" : email, "code_verify": code},
    );

    if (response.statusCode == 200) {
      return true; // Email exists
    } else {
      return false; // Email not exist
    }
  }

}