import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../storage.dart';

class UserInfoApi {
  late String token;
  late Map<String, String> headers = {};

  UserInfoApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!;
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future getUserInfo(String user_id) async {
    await _initializeHeaders();
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
