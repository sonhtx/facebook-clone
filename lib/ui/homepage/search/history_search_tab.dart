import 'package:anti_fb/api/search/search_api.dart';
import 'package:anti_fb/constants.dart';
import 'package:anti_fb/models/search/SavedSearch.dart';
import 'package:anti_fb/repository/search/search_repo.dart';
import 'package:anti_fb/ui/homepage/search/group_by_date_widget.dart';
import 'package:flutter/material.dart';

class HistorySearchTab extends StatefulWidget {
  HistorySearchTab({super.key});

  final SearchRepository _searchRepository = SearchRepository();

  @override
  State<StatefulWidget> createState() {
    return _HistorySearchTabState();
  }
}

class _HistorySearchTabState extends State<HistorySearchTab> {
  List<GroupByDateWidget> groupByDateWidget = [];
  @override
  void initState() {
    super.initState();
    getSavedSearch();
  }

  void delWhenGroupNull(String date) {
    setState(() {
      groupByDateWidget.removeWhere((element) => element.date == date);
    });
  }

  void handleClearAll() {
    setState(() {
      groupByDateWidget = [];
    });
    SearchApi searchApi = SearchApi();
    searchApi.delSavedSearch("0", "1");
  }

  String convertDateString(String dateString) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate =
        "${monthNames[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year}";
    return formattedDate;
  }

  Future<void> getSavedSearch() async {
    try {
      List<SavedSearch> savedSearchList =
          await widget._searchRepository.getSavedSearch('0', '15');
      setState(() {
        String date = "";
        List<SavedSearch> historySearchGroupList = [];
        for (int i = 0; i < savedSearchList.length; i++) {
          SavedSearch current = savedSearchList[i];
          if (date != convertDateString(current.created)) {
            if (date != "") {
              groupByDateWidget.add(GroupByDateWidget(
                  date, historySearchGroupList, delWhenGroupNull));
              historySearchGroupList = [];
            }
            date = convertDateString(current.created);
            print(date);
            historySearchGroupList.add(current);
          }
          date = convertDateString(current.created);
          historySearchGroupList.add(current);
        }
        groupByDateWidget.add(
            GroupByDateWidget(date, historySearchGroupList, delWhenGroupNull));
      });
    } catch (e) {
      print("error fetching saved search");
      print(e);
    }
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
    if (groupByDateWidget.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < groupByDateWidget.length; i++)
            groupByDateWidget[i],
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(
            color: BLACK,
            fontSize: 20,
            fontWeight: FONTBOLD,
          ),
        ),
        backgroundColor: WHITE,
        iconTheme: const IconThemeData(
          color: BLACK, // Màu của biểu tượng (mũi tên back)
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // const Divider(height: 30.0),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      handleClearAll();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: WHITE, // Màu chữ của nút
                      padding: EdgeInsets.zero, // Bỏ padding
                      minimumSize: Size(0, 0), // Bỏ kích thước tối thiểu
                      alignment: Alignment.center, // Canh giữa văn bản
                    ),
                    child: const Text(
                      'Clear all',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FONTBOLD,
                          color: BLUE),
                    ),
                  ),
                ],
              ),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
