import 'package:anti_fb/models/post/PostListSearchData.dart';
import 'package:anti_fb/models/request/ReqSearch.dart';
import 'package:anti_fb/models/search/SavedSearch.dart';
import 'package:anti_fb/repository/search/search_repo.dart';
import 'package:anti_fb/ui/homepage/homepage/listpost.dart';
import 'package:anti_fb/ui/homepage/homepage/postpage/post_screen.dart';
import 'package:anti_fb/ui/homepage/search/search_result_widget.dart';
import 'package:anti_fb/widgets/ButtonWidget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchResultTab extends StatefulWidget {
  final String keyword;
  SearchResultTab(this.keyword, {super.key});

  final SearchRepository _searchRepository = SearchRepository();

  @override
  State<StatefulWidget> createState() {
    return _SearchResultTabState();
  }
}

class _SearchResultTabState extends State<SearchResultTab> {
  TextEditingController controller = TextEditingController();
  List<PostWidget> postScreenList = [];

  @override
  void initState() {
    super.initState();
    controller.text = widget.keyword;
    getSearchResult(widget.keyword);
  }

  Future<void> getSearchResult(String keyword) async {
    try {
      List<PostListSearchData>? searchResultList = await widget
          ._searchRepository
          .getSearchResult(ReqSearch(keyword, null, "0", "10"));
      setState(() {
        postScreenList = searchResultList
                ?.map((current) => PostWidget(
                    current.id,
                    current.name,
                    current.image,
                    current.described,
                    current.created,
                    current.feel,
                    current.mark_comment,
                    current.is_felt,
                    current.author.name,
                    current.author.avatar))
                .toList() ??
            [];
        print(postScreenList);
      });
    } catch (e) {
      print("error fetching saved search");
      print(e);
    }
  }

  void handleSearch(String value) {
    print(value);
    getSearchResult(value);
  }

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
    if (postScreenList.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < postScreenList.length; i++) postScreenList[i],
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WHITE,
        iconTheme: const IconThemeData(
          color: BLACK, // Màu của biểu tượng (mũi tên back)
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 30,
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                // vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Search Facebook',
                    border: InputBorder.none,
                  ),
                  onSubmitted: handleSearch,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Divider(height: 30.0),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
