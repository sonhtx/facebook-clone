
import 'package:anti_fb/models/post/PostListData.dart';

import '../../api/post/post_api.dart';
import '../../models/request/ReqListPost_VideoData.dart';

class PostRepository{
  final PostApi _postApi = PostApi();
  Future getlistpost(RequestListPost_VideoData requestListPostData) async {
    try {
      final getlistpostResult = await _postApi.getListPost(requestListPostData);

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

  Future getPost (String id) async {
    try{
      final getPostResult = await _postApi.getPost(id);
      if(getPostResult == null) {

      }
    }catch (e) {
      print(e);
      return null; // Signup failed due to an error
    }
  }



}