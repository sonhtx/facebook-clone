import 'package:anti_fb/constants.dart';
import 'package:anti_fb/models/friend/SuggestedFriend.dart';
import 'package:anti_fb/repository/friend/friend_repo.dart';
import 'package:anti_fb/ui/homepage/friendpage/suggestiontag/suggested_friend_widget.dart';
import 'package:anti_fb/widgets/icon/IconSearchWidget.dart';
import 'package:flutter/material.dart';

class SuggestedFriendsTab extends StatefulWidget {
  SuggestedFriendsTab({super.key});

  final FriendRepository _friendRepository = FriendRepository();
  late List<SuggestedFriendWidget> suggestedWidgetList;

  @override
  State<StatefulWidget> createState() {
    return _SuggestedFriendsTabState();
  }
}

class _SuggestedFriendsTabState extends State<SuggestedFriendsTab> {
  @override
  void initState() {
    super.initState();
    widget.suggestedWidgetList = [];
    getFriendSuggest();
  }

  Future<void> getFriendSuggest() async {
    try {
      List<SuggestedFriend>? suggestList =
          await widget._friendRepository.getfriendsuggestion('0', '5');

      setState(() {
        widget.suggestedWidgetList = suggestList
                ?.map((curSuggest) => SuggestedFriendWidget(
                      curSuggest.id,
                      curSuggest.username,
                      curSuggest.avatar,
                      curSuggest.created,
                      curSuggest.sameFriends,
                    ))
                .toList() ??
            [];
      });
    } catch (e) {
      print("error fetching friend suggestions");
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
    if (widget.suggestedWidgetList.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < widget.suggestedWidgetList.length; i++)
            widget.suggestedWidgetList[i],
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suggestions',
          style: TextStyle(
            color: BLACK,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: WHITE,
        iconTheme: const IconThemeData(
          color: BLACK, // Màu của biểu tượng (mũi tên back)
        ),
        elevation: 0.0,
        actions: [
          IconSearchWidget(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15.0),
              const Text('People you may know',
                  style:
                      TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20.0),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
