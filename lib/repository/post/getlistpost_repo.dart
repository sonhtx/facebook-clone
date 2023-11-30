
import 'package:anti_fb/models/post/PostListData.dart';

import '../../data/post/getlistpost_api.dart';
import '../../models/request/ReqListPostData.dart';

class GetListPostRepository{
  static Future getlistpost(RequestListPostData requestListPostData) async {
    try {
      final getlistpostResult = await ListPostApi.getListPost(requestListPostData);

      if(getlistpostResult == null){
        return false;
      }

    List<PostListData> listpost = [];
      List<dynamic> listpostraw = getlistpostResult['data']['post'] ;
      for (dynamic x in listpostraw){
        PostListData post = PostListData.fromJson(x);
        listpost.add(post);
      }
      return listpost;

    } catch (e) {
      print(e);
      return null; // Signup failed due to an error
    }
  }



}