
import 'package:anti_fb/repository/friend/friend_repo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/friend/Friend.dart';


class FriendList extends StatefulWidget {

  FriendList({super.key});
  final FriendRepository _friendRepository = FriendRepository();
  late List<FriendWidget> suggestedWidgetList = [];

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {

  @override
  void initState() {
    super.initState();
    widget.suggestedWidgetList = [];
    getFriendList();
  }

  void removeItem(String id){
    setState(() {
      widget.suggestedWidgetList.removeWhere((obj) => obj.id == id);
    });
  }

  Future<void> getFriendList() async {
    try {
      List<Friend>? suggestList =
      await widget._friendRepository.getUserFriend("0", "5", "0");
      setState(() {
        widget.suggestedWidgetList = suggestList
            ?.map((curSuggest) => FriendWidget(
          curSuggest.id,
          curSuggest.username,
          curSuggest.avatar,
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
    return Column(
        children: widget.suggestedWidgetList
    );
  }

}

class FriendWidget extends StatelessWidget {
  final String id;
  final String username;
  final String avatar;
  final String same_friends;


  const FriendWidget(this.id, this.username, this.avatar, this.same_friends, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.0 ,
            backgroundColor: Colors.grey[200],
            backgroundImage: avatar == '' ? const AssetImage(defaultAvatar) as ImageProvider<Object>?
                : CachedNetworkImageProvider(avatar),
          ),
          Padding(
            padding: const EdgeInsets.only(left : 10),
            child : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username, style: const TextStyle(
                    fontSize: 13.0, fontWeight: FontWeight.bold)),
                Text('$same_friends mutual friends', style: const TextStyle(
                    fontSize: 11.0, fontWeight: FontWeight.bold, color: GREY)),
                ],
            ),
          ),
          // const Divider(height: 0.5, color: GREY, ),
        ],
      ),

    );

  }

}

