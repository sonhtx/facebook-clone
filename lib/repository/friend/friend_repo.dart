import 'package:anti_fb/models/friend/RequestedFriend.dart';
import 'package:anti_fb/models/friend/UserFriend.dart';

import '../../api/friend/friend_api.dart';
import '../../models/friend/SuggestedFriend.dart';

class FriendRepository {
  final FriendApi _friendApi = FriendApi();
  Future getfriendsuggestion(String index, String count) async {
    try {
      final friendSuggestionResult =
          await _friendApi.getFriendSuggestion(index, count);

      if (friendSuggestionResult != null) {
        List<SuggestedFriend> friendSuggestions = [];
        List<dynamic> data = friendSuggestionResult['data'];
        for (dynamic x in data) {
          SuggestedFriend frSuggestion = SuggestedFriend.fromJson(x);
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

  Future getRequestedFriend(String index, String count) async {
    try {
      final requestedFriendResult =
          await _friendApi.getRequestedFriend(index, count);

      if (requestedFriendResult != null) {
        List<RequestedFriend> requestedFriend = [];
        List<dynamic> data = requestedFriendResult["data"]["requests"];
        for (dynamic x in data) {
          RequestedFriend frSuggestion = RequestedFriend.fromJson(x);
          requestedFriend.add(frSuggestion);
        }
        return [requestedFriend, requestedFriendResult["data"]["total"]];
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return null; // Signup failed due to an error
    }
  }

  Future getUserFriend(String index, String count, String id) async {
    try {
      final userFriendResult =
          await _friendApi.getUserFriends(index, count, id);

      if (userFriendResult != null) {
        List<UserFriend> userFriend = [];
        List<dynamic> data = userFriendResult["data"]["friends"];
        for (dynamic x in data) {
          UserFriend frSuggestion = UserFriend.fromJson(x);
          userFriend.add(frSuggestion);
        }
        return [userFriend, userFriendResult["data"]["total"]];
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return null; // Signup failed due to an error
    }
  }
}
