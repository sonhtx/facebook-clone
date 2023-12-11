import 'package:anti_fb/models/friend/Friend.dart';

import '../../api/friend/friend_api.dart';

class FriendRepository {
  final FriendApi _friendApi = FriendApi();

  Future getfriendsuggestion(String index, String count) async {
    try {
      final friendSuggestionResult =
          await _friendApi.getFriendSuggestion(index, count);

      if (friendSuggestionResult != null) {
        List<Friend> friendSuggestions = [];
        List<dynamic> data = friendSuggestionResult['data'];
        for (dynamic x in data) {
          Friend frSuggestion = Friend.fromJson(x);
          friendSuggestions.add(frSuggestion);
        }
        return friendSuggestions;
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }

  Future getRequestedFriend(String index, String count) async {
    try {
      final requestedFriendResult =
          await _friendApi.getRequestedFriend(index, count);

      if (requestedFriendResult != null) {
        List<Friend> requestedFriend = [];
        List<dynamic> data = requestedFriendResult["data"]["requests"];
        for (dynamic x in data) {
          Friend frSuggestion = Friend.fromJson(x);
          requestedFriend.add(frSuggestion);
        }
        return [requestedFriend, requestedFriendResult["data"]["total"]];
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }

  Future getUserFriend(String index, String count, String id) async {
    try {
      final userFriendResult =
          await _friendApi.getUserFriends(index, count, id);

      if (userFriendResult != null) {
        List<Friend> userFriend = [];
        List<dynamic> data = userFriendResult["data"]["friends"];
        for (dynamic x in data) {
          Friend frSuggestion = Friend.fromJson(x);
          userFriend.add(frSuggestion);
        }
        return [userFriend, userFriendResult["data"]["total"]];
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }

  Future<bool> setRequestFriend(String id) async {
    try {
      final userFriendResult =
      await _friendApi.setRequestFriend(id);

      if (userFriendResult) {
        return true;
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }

  Future<bool> delRequestFriend(String id) async {
    try {
      final userFriendResult =
      await _friendApi.setRequestFriend(id);

      if (userFriendResult) {
        return true;
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return false; // Signup failed due to an error
    }
  }



}
