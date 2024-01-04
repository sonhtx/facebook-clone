
import 'dart:convert';

import 'package:anti_fb/models/request/ReqSetMarkComment.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../storage.dart';

class CommentApi {
  late String token;
  late Map<String, String> headers;

  CommentApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!; // Replace with your actual code to get the token
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
      Uri.parse('$apiUrl/get_mark_comment'),
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

  Future setMarkComment(ReqSetMarkCmtData req, bool type) async{
    await _initializeHeaders();
    final String jsonData;
    if(type){
      jsonData = jsonEncode(req.toJson2());
    } else {
      jsonData = jsonEncode(req.toJson1());
    }
    final response = await http.post(
      Uri.parse('$apiUrl/set_mark_comment'),
      headers: headers,
      body: jsonData,
    );
    if (response.statusCode == 200) {

      final jsonResponse = json.decode(response.body);
      String newCoin = jsonResponse['coins'].toString();

      await setCoin(newCoin);
      return true;
    } else {
      return false;
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
      String newCoin = jsonResponse['coins'].toString();

      await setCoin(newCoin);
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
    await _initializeHeaders();
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

