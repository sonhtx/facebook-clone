import 'package:anti_fb/constants.dart';
import 'package:anti_fb/models/friend/UserFriend.dart';
import 'package:anti_fb/repository/friend/friend_repo.dart';
import 'package:anti_fb/ui/homepage/friendpage/yourfriendtag/user_friend_widget.dart';
import 'package:anti_fb/widgets/icon/IconSearchWidget.dart';
import 'package:flutter/material.dart';

class YourFriendsTab extends StatefulWidget {
  YourFriendsTab({super.key});

  final FriendRepository _friendRepository = FriendRepository();
  late List<UserFriendWidget> userWidgetList;

  @override
  State<StatefulWidget> createState() {
    return _YourFriendsTabState();
  }
}

class _YourFriendsTabState extends State<YourFriendsTab> {
  String countFriends = "0";

  @override
  void initState() {
    super.initState();
    widget.userWidgetList = [];
    getFriendSuggest();
  }

  Future<void> getFriendSuggest() async {
    try {
      List<dynamic> result =
          await widget._friendRepository.getUserFriend('0', '5', '157');

      List<UserFriend>? listSuggest = result[0];
      countFriends = result[1];
      setState(() {
        widget.userWidgetList = listSuggest
                ?.map((curSuggest) => UserFriendWidget(
                    curSuggest.id,
                    curSuggest.username,
                    curSuggest.avatar,
                    curSuggest.created,
                    curSuggest.same_friends))
                .toList() ??
            [];
      });
    } catch (e) {
      print("error fetching user friends");
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
    if (widget.userWidgetList.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < widget.userWidgetList.length; i++)
            widget.userWidgetList[i],
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Friends',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$countFriends Friends',
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                  const Text('sort',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal)),
                ],
              ),
              const SizedBox(height: 15.0),
              content,
            ],
          ),
        ),
      ),
    );
  }
}
