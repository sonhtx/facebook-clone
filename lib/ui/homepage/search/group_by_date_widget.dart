import 'package:anti_fb/models/search/SavedSearch.dart';
import 'package:anti_fb/ui/homepage/search/history_search_widget.dart';
import 'package:flutter/material.dart';

class GroupByDateWidget extends StatefulWidget {
  final String date;
  final List<SavedSearch> historySearch;
  final Function(String date) delWhenGroupNull;

  GroupByDateWidget(this.date, this.historySearch, this.delWhenGroupNull,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return _GroupByDateState();
  }
}

class _GroupByDateState extends State<GroupByDateWidget> {
  List<HistorySearchWidget> historySearchWidget = [];

  @override
  void initState() {
    super.initState();
    convertToWidget();
  }

  void handleDelSearch(String id) {
    setState(() {
      if (historySearchWidget.length == 1) {
        widget.delWhenGroupNull(widget.date);
      } else {
        historySearchWidget.removeWhere((widget) => widget.id == id);
        widget.historySearch.removeWhere((element) => element.id == id);
      }
    });
  }

  void convertToWidget() {
    historySearchWidget = widget.historySearch
            .map((current) => HistorySearchWidget(
                current.id, current.keyword, current.created, handleDelSearch))
            .toList() ??
        [];
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        for (int i = 0; i < widget.historySearch.length; i++)
          historySearchWidget[i]
      ],
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.date,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        content,
      ],
    );
  }
}
