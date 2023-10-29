

import 'package:anti_fb/models/EnumData.dart';

import 'CommentData.dart';

class MarkData{
  String email;
  DateTime timestamp;
  String content;
  MarkStatus markStatus;
  List<CommentData> comments;

  MarkData(this.email, this.timestamp, this.content, this.markStatus, this.comments);
}