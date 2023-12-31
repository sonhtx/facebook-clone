
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import '../../storage.dart';

class BlockApi {
  late String token;
  late Map<String, String> headers = {};

  BlockApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!; // Replace with your actual code to get the token
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future getListBlock(String index, String count) async {
    await _initializeHeaders();
    final Map<String, String> requestBody = {
      "index" : index,
      "count" : count
    };
    final response = await http.post(
      Uri.parse('$apiUrl/get_list_blocks'),
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

  Future setBlock(String id) async {
    await _initializeHeaders();
    final Map<String, String> requestBody = {
      "user_id" : id
    };
    final response = await http.post(
      Uri.parse('$apiUrl/set_block'),
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

  Future unBlock(String id) async {
    await _initializeHeaders();
    final Map<String, String> requestBody = {
      "user_id" : id
    };
    final response = await http.post(
      Uri.parse('$apiUrl/unblock'),
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
}