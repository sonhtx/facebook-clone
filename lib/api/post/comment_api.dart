
import 'dart:convert';

import 'package:anti_fb/models/request/ReqSetMarkComment.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../storage.dart';

class ReactionApi {
  late String token;
  late Map<String, String> headers;

  ReactionApi() {
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

  Future getMarkComment(String id, String index, String count) async{
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {
      "id" : id,
      "index" : index,
      "count" : count,
    };
    final response = await http.post(
      Uri.parse('$apiUrl/get_post'),
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

  Future setMarkComment(ReqSetMarkCmtData req) async{
    await _initializeHeaders();
    final String jsonData = jsonEncode(req.toJson());
    final response = await http.post(
      Uri.parse('$apiUrl/set_mark_comment'),
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

  Future feel(String id, String type) async{
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {
      "id" : id,
      "type" : type,
    };
    final response = await http.post(
      Uri.parse('$apiUrl/feel'),
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

  Future getListFeel(String id, String index, String count) async{
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {
      "id" : id,
      "index" : index,
      "count" : count
    };
    final response = await http.post(
      Uri.parse('$apiUrl/get_list_feels'),
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

  Future deleteFeel(String id) async{
    final Map<String, dynamic> requestBody = {
      "id" : id,
    };
    final response = await http.post(
      Uri.parse('$apiUrl/delete_feel'),
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

