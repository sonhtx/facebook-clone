import 'package:anti_fb/models/request/ReqSearch.dart';
import 'package:anti_fb/models/search/SavedSearch.dart';

import '../../api/search/search_api.dart';

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
      final savedSearchResult = await _searchApi.search(reqSearch);

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
}
