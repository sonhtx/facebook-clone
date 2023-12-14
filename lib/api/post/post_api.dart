import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:anti_fb/models/request/ReqListPost_VideoData.dart';

import '../../constants.dart';
import '../../storage.dart';

class PostApi {
  late String token;
  late Map<String, String> headers = {};

  PostApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!;
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future getPost(String id) async {
    await _initializeHeaders();

    final Map<String, dynamic> requestBody = {"id": id};
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

  Future getListPost(RequestListPost_VideoData requestListPostData) async {
    await _initializeHeaders();
    final String jsonData = jsonEncode(requestListPostData.toJson());
    final response = await http.post(
      Uri.parse('$apiUrl/get_list_posts'),
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

  Future getListVideo(RequestListPost_VideoData req) async {
    await _initializeHeaders();

    final String jsonData = jsonEncode(req.toJson());
    final response = await http.post(
      Uri.parse('$apiUrl/get_list_videos'),
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

  Future deletePost(String id) async {
    await _initializeHeaders();
    final Map<String, String> requestBody = {"id": id};
    final response = await http.post(
      Uri.parse('$apiUrl/delete_post'),
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

  Future reportPost(String id, String subject, String detail) async {
    await _initializeHeaders();
    final Map<String, String> requestBody = {
      "id": id,
      "subject": subject,
      "details": detail
    };
    final response = await http.post(
      Uri.parse('$apiUrl/report_post'),
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
