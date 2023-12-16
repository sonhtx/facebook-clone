

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../storage.dart';

class LogoutApi{
  late String token;
  late Map<String, String> headers = {};

  LogoutApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!; // Replace with your actual code to get the token
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
  Future logout() async {
    await _initializeHeaders();
    final response = await http.post(
      Uri.parse('$apiUrl/logout'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false; // Logout failed
    }
  }
}