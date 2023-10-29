

import 'package:image_picker/image_picker.dart';

import 'MarkData.dart';

class PostData{
  String email;
  DateTime timestamp;
  String content;
  List<XFile>? images;
  XFile? video;
  List<MarkData> marks;

  int numKudos;
  int numDissapoint;

  PostData(this.email, this.timestamp, this.content, this.images, this.video,
      this.marks, this.numKudos, this.numDissapoint);
}