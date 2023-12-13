
import 'package:anti_fb/models/comment/poster.dart';

class CommentData {
  final String content;
  final String created;
  final PosterData poster;

  CommentData({required this.content, required this.created,
        required this.poster});

  factory CommentData.fromJson(Map<String, dynamic> json) {
    PosterData posterData = PosterData.fromJson(json['poster']);
    
    return CommentData(
      content: json['content'] as String,
      created: json['created'] as String,
      poster: posterData,
    );
  }
}