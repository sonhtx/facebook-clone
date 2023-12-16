import 'package:anti_fb/api/friend/friend_api.dart';
import 'package:anti_fb/api/search/search_api.dart';
import 'package:flutter/material.dart';

class HistorySearchWidget extends StatefulWidget {
  final String id;
  final String keyword;
  final String created;

  final Function(String id) delWhenDelSearch;

  HistorySearchWidget(
      this.id, this.keyword, this.created, this.delWhenDelSearch,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return _HistorySearchWidget();
  }
}

class _HistorySearchWidget extends State<HistorySearchWidget> {
  void handleDelSavedSearch() {
    SearchApi searchApi = SearchApi();
    searchApi.delSavedSearch(widget.id, "0");
    widget.delWhenDelSearch(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 70, 126, 199),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'You searched on facebook',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.keyword,
                style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(197, 14, 13, 13)),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.lock,
                    size: 12,
                  ),
                  Text(
                    'Only you',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(197, 14, 13, 13)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Hidden on your profile',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(197, 14, 13, 13)),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: handleDelSavedSearch,
              icon: const Icon(
                Icons.clear,
              ))
        ],
      ),
    );
  }
}
