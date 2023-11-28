

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../constants.dart';
import '../../models/post/CreatePostData.dart';
import '../../storage.dart';

class AddPostApi{

  static Future<void> addPost(CreatePostData createPostData) async {
    String? jwtToken = await getJwt();
    String token = jwtToken!;

    print(token);

    final Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
      // Add any additional headers you need
    };
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
    final String responseBody = await response.stream.bytesToString();
    print(responseBody);

  }
}