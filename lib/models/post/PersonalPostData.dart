

import 'package:image_picker/image_picker.dart';

import 'MarkData.dart';

class PersonalPostData{
  String userid;
  DateTime timestamp;
  String content;
  List<XFile>? images;
  XFile? video;
  List<MarkData> marks;

  int numKudos;
  int numDissapoint;



  PersonalPostData(this.userid, this.timestamp, this.content, this.images, this.video,
      this.marks, this.numKudos, this.numDissapoint);
}