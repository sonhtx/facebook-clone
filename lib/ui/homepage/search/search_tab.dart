import 'package:anti_fb/models/search/SavedSearch.dart';
import 'package:anti_fb/repository/search/search_repo.dart';
import 'package:anti_fb/ui/homepage/search/history_search_tab.dart';
import 'package:anti_fb/ui/homepage/search/search_result_tab.dart';
import 'package:anti_fb/ui/homepage/search/search_result_widget.dart';
import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

  final SearchRepository _searchRepository = SearchRepository();
  

  @override
  State<StatefulWidget> createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController controller = TextEditingController();
List<SavedSearchWidget> savedSearchWidgetList = [];
  @override
  void initState() {
    super.initState();
    getSavedSearch();
  }

  Future<void> getSavedSearch() async {
    try {
      List<SavedSearch>? listSuggest =
          await widget._searchRepository.getSavedSearch('0', '5');
      setState(() {
        savedSearchWidgetList = listSuggest
                ?.map((curSuggest) => SavedSearchWidget(
                      curSuggest.id,
                      curSuggest.keyword,
                      curSuggest.created,
                    ))
                .toList() ??
            [];
        print(savedSearchWidgetList);
      });
    } catch (e) {
      print(e);
    }
  }

  void handleSearch(String value) {
    print(value);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => SearchResultTab(value)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh no ... nothing here!',
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different catogory',
          ),
        ],
      ),
    );
    if (savedSearchWidgetList.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < savedSearchWidgetList.length; i++)
            savedSearchWidgetList[i],
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // ),
        body: SingleChildScrollView(
          child: Container(
            // Center is a layout  It takes a single child and positions it
            // in the middle of the parent.
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => {Navigator.of(context).pop()},
                    ),
                    Container(
                      width: 300,
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        // vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: GREY[300],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Search Facebook',
                          border: InputBorder.none,
                        ),
                        onSubmitted: handleSearch,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Recent',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FONTBOLD)),
                    ButtonWidget(
                      buttonText: 'See all',
                      textColor: BLACK,
                      backgroundColor: WHITE,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => HistorySearchTab()));
                      },
                      paddingTop: 0,
                      width: 100,
                    )
                  ],
                ),
                const Divider(height: 30.0),
                content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
