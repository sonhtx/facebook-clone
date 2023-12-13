
import 'package:anti_fb/models/comment/poster.dart';

import 'comment.dart';

class MarkData{
  final String id;
  final String mark_content;
  final String type_of_mark;
  final String created;
  final PosterData poster;
  final List<CommentData> comments;

  MarkData({required this.id, required this.mark_content, required this.type_of_mark,
              required this.created, required this.poster, required this.comments});

  factory MarkData.fromJson(Map<String, dynamic> json) {
    PosterData posterData = PosterData.fromJson(json['poster']);

    List<CommentData> listComments = [];
    List<dynamic> commentjson = json['comments'];
    for(dynamic x in commentjson) {
      CommentData z = CommentData.fromJson(x);
      listComments.add(z);
    }

    return MarkData(
      id: json['id'] as String,
      mark_content: json['mark_content'] as String,
      type_of_mark: json['type_of_mark'] as String,
      created: json['created'] as String,
      poster: posterData,
      comments: listComments,
    );
  }

}