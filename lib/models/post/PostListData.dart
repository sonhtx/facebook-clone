// post data for get_list_post api

import 'package:anti_fb/models/post/AuthorData.dart';
import 'ImageData.dart';

class   PostListData {
  final String id;
  final String name;
  final List<ImageData> image;
  final String described;
  final String created;
  final String feel;
  final String comment_mark;
  final String is_felt;
  final String is_blocked;
  final String can_edit;
  final String banned;
  final String state;
  final AuthorData author;


  PostListData({required this.id, required this.name, required this.image,
    required this.described, required this.created, required this.feel,
    required this.comment_mark, required this.is_felt, required this.is_blocked,
    required this.can_edit, required this.banned, required this.state,
    required this.author});

  factory PostListData.fromJson(Map<String, dynamic> json) {
    List<ImageData> images= [];
    List<dynamic> imagejson = json['image'];
    for(dynamic x in imagejson) {
      ImageData z = ImageData.fromJson(x);
      images.add(z);
    }

    AuthorData author = AuthorData.fromJson(json['author']);

    return PostListData(
      id: json['id'] as String,
      name: json['name'] as String,
      image : images,
      described : json['described'] as String,
      created : json['created'] as String,
      feel : json['feel'] as String,
      comment_mark: json['comment_mark'] as String,
      is_felt : json['is_felt'] as String,
      is_blocked : json['is_blocked'] as String,
      can_edit : json['can_edit'] as String,
      banned : json['banned'] as String,
      state : json['state'] as String,
      author: author

    );
  }

}