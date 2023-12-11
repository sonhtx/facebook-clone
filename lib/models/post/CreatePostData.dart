

import 'package:image_picker/image_picker.dart';

class CreatePostData{
  late String described;
  late List<XFile>? images = [] ;
  late XFile? video = null;
  late String status ;
  late String auto_accept ;

  CreatePostData();

  // CreatePostData(this.decribed, this.images, this.video, this.status);
}