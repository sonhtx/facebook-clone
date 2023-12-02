

import '../../api/friend/friend_api.dart';
import '../../models/friend/FriendSuggestion.dart';

class FriendRepository{
  final FriendApi _friendApi = FriendApi();
  Future getfriendsuggestion(String index, String count) async {
    try {
      final friendSuggestionResult = await _friendApi.getFriendSuggestion(index, count);

      if(friendSuggestionResult != null){
        List<FriendSuggestion> friendSuggestions = [];
        List<dynamic> data = friendSuggestionResult['data'];
        for(dynamic x in data){
          FriendSuggestion frSuggestion = FriendSuggestion.fromJson(x);
          friendSuggestions.add(frSuggestion);
        }
        return friendSuggestions;
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return null; // Signup failed due to an error
    }
  }




}