
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import '../../models/request/ReqPasswordChange.dart';
import '../../storage.dart';

class ChangePassWordApi{
  late String token;
  late Map<String, String> headers = {};

  ChangePassWordApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!; // Replace with your actual code to get the token
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future changePassword(ReqChangePassword reqChangePassword) async {
    await _initializeHeaders();
    final String jsonData = jsonEncode(reqChangePassword.toJson());
    final response = await http.post(
      Uri.parse('$apiUrl/change_password'),
      headers: headers,
      body: jsonData,
    );
    
    if (response.statusCode != 401) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse; // Login successful
    } else {
      return false; // Login failed
    }
  }

}