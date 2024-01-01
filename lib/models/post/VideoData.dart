
import 'AuthorData.dart';

class VideoData {
  final String id;
  final String name;
  final String video_url;
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


  VideoData({required this.id, required this.name, required this.video_url,
    required this.described, required this.created, required this.feel,
    required this.comment_mark, required this.is_felt, required this.is_blocked,
    required this.can_edit, required this.banned, required this.state,
    required this.author});

  factory VideoData.fromJson(Map<String, dynamic> json) {

    AuthorData author = AuthorData.fromJson(json['author']);

    return VideoData(
        id: json['id'] as String,
        name: json['name'] as String,
        video_url : json['video']['url'] as String,
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