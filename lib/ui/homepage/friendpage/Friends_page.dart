import 'package:anti_fb/models/friend/RequestedFriend.dart';
import 'package:anti_fb/repository/friend/friend_repo.dart';
import 'package:anti_fb/ui/homepage/friendpage/requested_friend_widget.dart';
import 'package:anti_fb/ui/homepage/friendpage/suggestiontag/suggested_friend_tab.dart';
import 'package:anti_fb/ui/homepage/friendpage/yourfriendtag/your_friends_tab.dart';
import 'package:anti_fb/ui/homepage/search/search_tab.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../widgets/icon/IconSearchWidget.dart';

/*
"email": "namvh@email.com",
  "password": "123456",
  "uuid": "string"
*/

class FriendsPage extends StatefulWidget {
  FriendsPage({super.key});

  final FriendRepository _friendRepository = FriendRepository();

  @override
  State<StatefulWidget> createState() {
    return _FriendsPageState();
  }
}

class _FriendsPageState extends State<FriendsPage> {
  String countRequest = '0';

  @override
  void initState() {
    super.initState();
    getFriendSuggest();
  }

  List<FriendRequestWidget> requestWidgetList = [];

  void delWhenAcceptOrDelete(String id) {
    setState(() {
      requestWidgetList.removeWhere((element) => element.id == id);
      countRequest = requestWidgetList.length.toString();
    });
  }

  Future<void> getFriendSuggest() async {
    try {
      List<dynamic> result =
          await widget._friendRepository.getRequestedFriend('0', '5');

      List<RequestedFriend>? listSuggest = result[0];
      countRequest = result[1];
      setState(() {
        requestWidgetList = listSuggest
                ?.map((curSuggest) => FriendRequestWidget(
                      curSuggest.id,
                      curSuggest.username,
                      curSuggest.avatar,
                      curSuggest.created,
                      delWhenAcceptOrDelete,
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
    if (requestWidgetList.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < requestWidgetList.length; i++)
            requestWidgetList[i],
        ],
      );
    }

    void selectSuggest(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => SuggestedFriendsTab(),
        ),
      );
    }

    void selectAllFriend(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => YourFriendsTab(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Friends',
          style: TextStyle(
            color: BLACK,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: WHITE,
        elevation: 0.0,
        actions: [
          IconSearchWidget(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => SearchTab(),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30.0)),
                  child: TextButton(
                    onPressed: () {
                      selectSuggest(context);
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'Suggestions',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: BLACK),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30.0)),
                  child: TextButton(
                    onPressed: () {
                      selectAllFriend(context);
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'All Friends',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: BLACK),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 30.0),
            Row(
              children: [
                const Text('Friend Requests',
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),
                const SizedBox(width: 10.0),

                //count of friend requests
                Text(
                  countRequest,
                  style: const TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            content,
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
