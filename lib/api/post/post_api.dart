import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:anti_fb/models/request/ReqListPost_VideoData.dart';

import '../../constants.dart';
import '../../storage.dart';

class PostApi {
  late String token;
  late Map<String, String> headers = {};

  PostApi() {
    // Initialize headers by fetching the token from secure storage
    // _initializeHeaders();
  }

  Future<void> _initializeHeaders() async {
    // Fetch the token from secure storage
    // Replace with your actual code to get the token
    token = (await getJwt())!;
    // token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzM5LCJkZXZpY2VfaWQiOiJzdHJpbmciLCJpYXQiOjE3MDI1NDYxMzB9.1AjbOAPEEQBfUN9wAdeIBhAG-s1I6cUWiUaMap1MTAs';
    print(token);
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
    print("Encouter");
    await _initializeHeaders();
    print(token);
    final String jsonData = jsonEncode(requestListPostData.toJson());
    final response = await http.post(
      Uri.parse('$apiUrl/get_list_posts'),
      headers: headers,
      body: jsonData,
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
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
