

import 'dart:convert';
import 'package:anti_fb/storage.dart';

import '../../constants.dart';
import 'package:http/http.dart' as http;

import '../../models/request/ReqSetNotification.dart';

class SettingApi {

  late String token;
  late Map<String, String> headers = {};

  SettingApi();
  Future<void> _initializeHeaders() async {
    token = (await getJwt())!; // Replace with your actual code to get the token
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future setDevToken (String devtype, String devtoken) async {
    await _initializeHeaders();
    final Map<String, String> requestBody = {
      'devtype' : devtype,
      'devtoken' : devtoken
    };
    final response = await http.post(
      Uri.parse('$apiUrl/set_devtoken'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse; // get list success
    } else {
      return null; // get list false
    }
  }

  Future buyCoins (String coins) async {
    await _initializeHeaders();
    final Map<String, String> requestBody = {
      'code' : 'string',
      'coins' : coins
    };
    final response = await http.post(
      Uri.parse('$apiUrl/buy_coins'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse; // get list success
    } else {
      return null; // get list false
    }
  }

  Future getPushSettings () async {
    await _initializeHeaders();
    final response = await http.post(
      Uri.parse('$apiUrl/get_push_settings'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return jsonResponse; // get list success
    } else {
      return null; // get list false
    }
  }

  Future setPushSettings (RequestSetNotification req) async {
    await _initializeHeaders();

    final String jsonData = jsonEncode(req.toJson());
    final response = await http.post(
      Uri.parse('$apiUrl/set_push_settings'),
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