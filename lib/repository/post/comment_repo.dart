

import 'package:anti_fb/models/comment/mark.dart';

import '../../api/post/comment_api.dart';

class CommentRepository{
  final CommentApi _commentApi = CommentApi();

  Future getMarkComment(String id, String index, String count) async {
    try{
      final getMarkComment = await _commentApi.getMarkComment(id, index, count);
      if(getMarkComment == null){
        return false;
      } else {
        List<MarkData> marks = [];

        List<dynamic> listMarkRaw = getMarkComment['data'];
        for (dynamic x in listMarkRaw){
          MarkData mark = MarkData.fromJson(x);
          marks.add(mark);
        }
        return marks;
      }
    } catch(e){
      return false;
    }

  }
}