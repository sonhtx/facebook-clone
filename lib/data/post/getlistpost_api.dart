
import 'dart:convert';
import 'package:http/http.dart' as http;


import 'package:anti_fb/models/request/ReqListPostData.dart';

import '../../constants.dart';
import '../../storage.dart';

class ListPostApi{

  static Future getListPost(RequestListPostData requestListPostData) async {

    // String? jwtToken = await getJwt();
    String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTU3LCJkZXZpY2VfaWQiOiJzdHJpbmciLCJpYXQiOjE3MDEzNDk2OTF9.tNAYahFw37vLV5rg7qgmBEBwcTt5TUIARqcNLFQ0Lyk';

    print("token get list post : $token");

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      // Add any additional headers you need
    };

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

}