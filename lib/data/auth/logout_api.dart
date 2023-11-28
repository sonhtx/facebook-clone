

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../storage.dart';


class LogoutApi{

  static Future logout() async {
    String? jwtToken = await getJwt();
    String token = jwtToken!;

    final Map<String, String> headers = {
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      // Add any additional headers you need
    };

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