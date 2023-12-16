import 'dart:convert';
import 'package:anti_fb/storage.dart';

import '../../constants.dart';
import 'package:http/http.dart' as http;

class FriendApi {
  late String token;
  late Map<String, String> headers = {};

  FriendApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!;
    headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future getRequestedFriend(String index, String count) async {
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {
      "index": index,
      "count": count,
    };
    final response = await http.post(
      Uri.parse('$apiUrl/get_requested_friends'),
      headers: headers,
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      return false; // Email not exist
    }
  }

  Future setRequestFriend(String user_id) async {
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {"user_id": user_id};
    final response = await http.post(
      Uri.parse('$apiUrl/set_request_friend'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false; // Email not exist
    }
  }

  Future setAcceptFriend(String user_id, String is_accept) async {
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {
      "user_id": user_id,
      "is_accept": is_accept,
    };
    final response = await http.post(
      Uri.parse('$apiUrl/set_accept_friend'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print("set accept friend api done");
      return jsonResponse;
    } else {
      return false;
    }
  }

  Future getUserFriends(String index, String count, String user_id) async {
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {
      "index": index,
      "count": count,
      "user_id": user_id
    };
    final response = await http.post(
      Uri.parse('$apiUrl/get_user_friends'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      return false; // Email not exist
    }
  }

  Future getFriendSuggestion(String index, String count) async {
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {
      "index": index,
      "count": count,
    };
    final response = await http.post(
      Uri.parse('$apiUrl/get_suggested_friends'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      return false; // Email not exist
    }
  }

  Future unFriend(String user_id) async {
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {"user_id": user_id};
    final response = await http.post(
      Uri.parse('$apiUrl/unfriend'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      return false; // Email not exist
    }
  }

  Future delRequestFriend(String user_id) async {
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {"user_id": user_id};
    final response = await http.post(
      Uri.parse('$apiUrl/del_request_friend'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      print("set del request friend api done");
      return true;
    } else {
      return false; // Email not exist
    }
  }

  Future setBlock(String user_id) async {
    await _initializeHeaders();
    final Map<String, dynamic> requestBody = {"user_id": user_id};
    final response = await http.post(
      Uri.parse('$apiUrl/set_block'),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      print("set block friend api done");
      return true;
    } else {
      return false; // Email not exist
    }
  }
}
