import 'package:anti_fb/models/request/ReqSetUserinfo.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../storage.dart';

class ProfileApi {
  late String token;

  late Map<String, String> headers = {};

  ProfileApi() {
    // Initialize headers by fetching the token from secure storage
  }

  Future<void> _initializeHeaders() async {
    // Fetch the token from secure storage
    token = (await getJwt())!; // Replace with your actual code to get the token

    // Update the headers with the fetched token
    headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
  }

  Future<void> changeProfileAfterSignup(String username, XFile? avatar) async {
    await _initializeHeaders();

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$apiUrl/change_profile_after_signup'),
    );

    request.headers.addAll(headers);
    request.fields['username'] = username;

    if (avatar != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'avatar',
          avatar.path,
          contentType:
              MediaType('image', 'jpeg'), // Adjust the content type as needed
        ),
      );
    }
    final response = await request.send();

    // Process the response
    final String responseBody = await response.stream.bytesToString();
    print(responseBody);
  }

  Future<void> setUserInfo(ReqSetUserinfo req) async {
    await _initializeHeaders();

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('$apiUrl/change_profile_after_signup'),
    );

    request.headers.addAll(headers);
    request.fields['username'] = req.username;
    request.fields['description'] = req.description;
    request.fields['address'] = req.address;
    request.fields['city'] = req.city;
    request.fields['country'] = req.country;
    request.fields['link'] = req.link;

    final avatar = req.avatar;
    final cover_image = req.cover_image;

    if (avatar != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'avatar',
          avatar.path,
          contentType:
              MediaType('image', 'jpeg'), // Adjust the content type as needed
        ),
      );
    }
    if (cover_image != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          'cover_image',
          cover_image.path,
          contentType:
              MediaType('image', 'jpeg'), // Adjust the content type as needed
        ),
      );
    }
    final response = await request.send();

    // Process the response
    final String responseBody = await response.stream.bytesToString();
    print(responseBody);
  }
}
