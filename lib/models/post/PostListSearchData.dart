// post data for get_list_post api

import 'package:anti_fb/models/post/AuthorData.dart';
import 'ImageData.dart';

class PostListSearchData {
  final String id;
  final String name;
  final List<ImageData> image;
  final String described;
  final String created;
  final String feel;
  final String mark_comment;
  final String is_felt;
  final String is_blocked;
  final String can_edit;
  final String banned;
  final String state;
  final AuthorData author;

  PostListSearchData(
      {required this.id,
      required this.name,
      required this.image,
      required this.described,
      required this.created,
      required this.feel,
      required this.mark_comment,
      required this.is_felt,
      required this.is_blocked,
      required this.can_edit,
      required this.banned,
      required this.state,
      required this.author});

  factory PostListSearchData.fromJson(Map<String, dynamic> json) {
    List<ImageData> images = [];
    List<dynamic> imagejson = json['image'];
    for (dynamic x in imagejson) {
      ImageData z = ImageData.fromJson(x);
      images.add(z);
    }

    AuthorData author = AuthorData.fromJson(json['author']);

    return PostListSearchData(
        id: json['id'],
        name: json['name'] ?? "",
        image: images,
        described: json['described'] ?? "",
        created: json['created'] ?? "",
        feel: json['feel'],
        mark_comment: json['mark_comment'] ?? "",
        is_felt: json['is_felt'] ?? "",
        is_blocked: json['is_blocked'] ?? "",
        can_edit: json['can_edit'] ?? "",
        banned: json['banned'] ?? "",
        state: json['state'] ?? "",
        author: author);
  }
}
