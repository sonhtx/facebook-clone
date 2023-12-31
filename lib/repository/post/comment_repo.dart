

import 'package:anti_fb/models/comment/mark.dart';

import '../../api/post/comment_api.dart';
import '../../models/request/ReqSetMarkComment.dart';

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

  Future<bool> setMarkComment(ReqSetMarkCmtData req, bool type) async {
    try{
      final setMarkComment = await _commentApi.setMarkComment(req, type);
      if(setMarkComment ){
        return true;
      } else {
        return false;
      }
    } catch(e){
      return false;
    }
  }


}