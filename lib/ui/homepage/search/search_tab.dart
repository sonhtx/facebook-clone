import 'package:anti_fb/models/search/SavedSearch.dart';
import 'package:anti_fb/repository/search/search_repo.dart';
import 'package:anti_fb/ui/homepage/search/search_result_widget.dart';
import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchTab extends StatefulWidget {
  SearchTab({super.key});

  final SearchRepository _searchRepository = SearchRepository();
  late List<SearchResultWidget> searchResultWidgetList;

  @override
  State<StatefulWidget> createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.searchResultWidgetList = [];
    getSearchResult();
  }

  Future<void> getSearchResult() async {
    try {
      List<SavedSearch>? listSuggest =
          await widget._searchRepository.getSavedSearch('0', '5');
      setState(() {
        widget.searchResultWidgetList = listSuggest
                ?.map((curSuggest) => SearchResultWidget(
                      curSuggest.id,
                      curSuggest.keyword,
                      curSuggest.created,
                    ))
                .toList() ??
            [];
        print(widget.searchResultWidgetList);
      });
    } catch (e) {
      print("error fetching saved search");
      print(e);
    }
  }

  void handleSearch(String value) {}

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh no ... nothing here!',
            // style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            //       color: Theme.of(context).colorScheme.onBackground,
            // ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different catogory',
            // style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //       color: Theme.of(context).colorScheme.onBackground,
            // ),
          ),
        ],
      ),
    );
    if (widget.searchResultWidgetList.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < widget.searchResultWidgetList.length; i++)
            widget.searchResultWidgetList[i],
        ],
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
      body: SingleChildScrollView(
        child: Container(
          // Center is a layout widget. It takes a single child and positions it
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
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Search Facebook',
                        border: InputBorder.none,
                      ),
                      onChanged: handleSearch,
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
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ButtonWidget(
                    buttonText: 'See all',
                    textColor: BLACK,
                    backgroundColor: WHITE,
                    onPressed: () {
                      Navigator.pushNamed(context, '/history_search');
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
    );
  }
}
