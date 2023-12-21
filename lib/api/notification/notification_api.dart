import 'dart:convert';
import 'package:anti_fb/models/request/ReqListNotification.dart';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import '../../storage.dart';

class NotificationApi{
  late String token;
  late Map<String, String> headers = {};

  NotificationApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!;
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future getListNotification(RequestListNotification requestListNotification) async{
    await _initializeHeaders();
    final String jsonData = jsonEncode(requestListNotification.toJson());
    final response = await http.post(
      Uri.parse('$apiUrl/get_notification'),
      headers: headers,
      body: jsonData,
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse; // get list success
    } else {
      return null; // get list false
    }
  }
}