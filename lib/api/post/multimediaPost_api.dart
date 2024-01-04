

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../constants.dart';
import '../../models/post/CreatePostData.dart';
import '../../storage.dart';

class AddPostApi{
  late String token;
  late Map<String, String> headers = {};

  AddPostApi();

  Future<void> _initializeHeaders() async {
    token = (await getJwt())!; // Replace with your actual code to get the token
    headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
  }

  Future<void> addPost(CreatePostData createPostData) async {
    await _initializeHeaders();
    
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$apiUrl/add_post'),
    );

    // Add headers to the request
    request.headers.addAll(headers);

    // Add other fields to the request
    request.fields['described'] = createPostData.described;
    request.fields['status'] = createPostData.status;
    request.fields['auto_accept'] = createPostData.auto_accept;


    // Add images to the request
    if (createPostData.images != null) {
      for (var image in createPostData.images!) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            image.path,
            contentType: MediaType('image', 'jpeg'), // Adjust the content type as needed
          ),
        );
      }
    }

    // Add video to the request
    if (createPostData.video != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'video',
          createPostData.video!.path,
          contentType: MediaType('video', 'mp4'), // Adjust the content type as needed
        ),
      );
    }

    // Send the request
    final response = await request.send();
    // Process the response
    final responseBody = await response.stream.bytesToString();
    Map<String, dynamic> jsonData = json.decode(responseBody);
    String newCoin = jsonData['data']['coins'].toString();
    print(newCoin);
    await setCoin(newCoin);
    print(responseBody);

  }

  // Future editPost(String id) async {
  //   await _initializeHeaders();
  //
  //   final response = await http.post(
  //     Uri.parse('$apiUrl/get_list_posts'),
  //     headers: headers,
  //   );
  //   if (response.statusCode == 200) {
  //
  //     return jsonResponse; // get list success
  //   } else {
  //     return null; // get list false
  //   }
  // }
}