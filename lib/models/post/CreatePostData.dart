

import 'package:image_picker/image_picker.dart';

class CreatePostData{
  int userid;
  DateTime? timestamp;
  String content;
  List<XFile>? images;
  XFile? video;

  CreatePostData(this.userid, this.timestamp, this.content, this.images, this.video);
}