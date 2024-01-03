import 'package:flutter/material.dart';

import '../../../constants.dart';

class SavedSearchWidget extends StatefulWidget {
  final String id;
  final String created;
  final String keyword;

  const SavedSearchWidget(this.id, this.keyword, this.created, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchResultWidget();
  }
}

class _SearchResultWidget extends State<SavedSearchWidget> {
  bool isRequested = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.search_rounded,
            size: 22.0, // Kích thước của biểu tượng
            color: BLACK, // Màu của biểu tượng
          ),
          const SizedBox(width: 20.0),
          Text(
            widget.keyword,
            style: const TextStyle(fontSize: 14.0, fontWeight: FONTBOLD),
          ),
        ],
      ),
    );
  }
}
