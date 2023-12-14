import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../storage.dart';

class UserInfoApi {
  late String token;
  late Map<String, String> headers = {};

  UserInfoApi() {
    // Initialize headers by fetching the token from secure storage
  }

  Future<void> _initializeHeaders() async {
    // Fetch the token from secure storage
    token = (await getJwt())!; // Replace with your actual code to get the token

    // Update the headers with the fetched token
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future getUserInfo(String user_id) async {
    await _initializeHeaders();
    print(token + " here is token");
    final Map<String, dynamic> requestBody = {
      "user_id": user_id,
    };
    final response = await http.post(
      Uri.parse('$apiUrl/get_user_info'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 201) {
      final jsonResponse = json.decode(response.body);
      Map<String, dynamic> userJson = jsonResponse['data'];
      return userJson; // get list success
    } else {
      return null; // get list false
    }
  }
}
