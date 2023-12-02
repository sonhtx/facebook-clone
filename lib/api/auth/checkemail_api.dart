

import 'package:http/http.dart' as http;
import '../../constants.dart';

class CheckEmailApi{

  static Future<bool> checkEmailExist(String email) async {
    final response = await http.post(
      Uri.parse('$authUrl/checkemail'),
      body: {"email" : email},
    );

    if (response.statusCode == 200) {
      return true; // Email exists
    } else {
      return false; // Email not exist
    }
  }
}