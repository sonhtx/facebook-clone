import 'package:anti_fb/models/post/PostListSearchData.dart';
import 'package:anti_fb/models/request/ReqSearch.dart';
import 'package:anti_fb/models/request/ReqSearchUser.dart';
import 'package:anti_fb/models/search/SavedSearch.dart';

import '../../api/search/search_api.dart';
import '../../models/SearchUser.dart';

class SearchRepository {
  final SearchApi _searchApi = SearchApi();

  Future getSavedSearch(String index, String count) async {
    try {
      final savedSearchResult = await _searchApi.getSavedSearch(index, count);

      if (savedSearchResult != null) {
        List<SavedSearch> savedSearchList = [];
        List<dynamic> data = savedSearchResult['data'];
        print(data);
        for (dynamic x in data) {
          SavedSearch frSuggestion = SavedSearch.fromJson(x);
          savedSearchList.add(frSuggestion);
        }
        return savedSearchList;
      } else {
        return false; // Signup failed
      }
    } catch (e) {
      print(e);
      return null; // Signup failed due to an error
    }
  }

  Future getSearchResult(ReqSearch reqSearch) async {
    try {
      final getlistpostResult = await _searchApi.search(reqSearch);

      if (getlistpostResult == null) {
        return false;
      }

      List<PostListSearchData> listpost = [];
      List<dynamic> listpostraw = getlistpostResult['data'];
      for (dynamic x in listpostraw) {
        PostListSearchData post = PostListSearchData.fromJson(x);
        listpost.add(post);
      }
      return listpost;
    } catch (e) {
      print(e);
      return null; // Signup failed due to an error
    }
  }

  Future getSearchUserResult(ReqSearchUser reqSearch) async {
    try {
      final getlistUserResult = await _searchApi.searchUser(reqSearch);

      if (getlistUserResult == null) {
        return null;
      }
      if(getlistUserResult['code'] == "1003"){
        return null;
      }
      print(getlistUserResult);

      List<SearchUser> listUser = [];
      List<dynamic> listUserRaw = getlistUserResult['data'];
      for (dynamic x in listUserRaw) {
        SearchUser user = SearchUser.fromJson(x);
        listUser.add(user);
      }
      return listUser;
    } catch (e) {
      print(e);
      return null; // Signup failed due to an error
    }
  }
}
