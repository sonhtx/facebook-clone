
import 'package:anti_fb/repository/friend/friend_repo.dart';
import 'package:anti_fb/widgets/TextButtonWidget.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../models/friend/Friend.dart';


class SuggestionList extends StatefulWidget {

  SuggestionList({super.key});
  final FriendRepository _friendRepository = FriendRepository();
  late List<SuggestionWidget> suggestedWidgetList = [];

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {

  @override
  void initState() {
    super.initState();
    widget.suggestedWidgetList = [];
    getFriendSuggest();
  }

  void removeItem(String id){
    setState(() {
      widget.suggestedWidgetList.removeWhere((obj) => obj.id == id);
    });
  }

  Future<void> getFriendSuggest() async {
    try {
      List<Friend>? suggestList =
      await widget._friendRepository.getfriendsuggestion('0', '5');

      setState(() {
        widget.suggestedWidgetList = suggestList
            ?.map((curSuggest) => SuggestionWidget(
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

class SuggestionWidget extends StatelessWidget {
  final String id;
  final String username;
  final String avatar;
  final String same_friends;


  const SuggestionWidget(this.id, this.username, this.avatar, this.same_friends, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
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
                _ButtonWidget(id)

              ],
            ),
          ),
          // const Divider(height: 0.5, color: GREY, ),
        ],
      ),

    );

  }


}

class _ButtonWidget extends StatefulWidget{
  _ButtonWidget(this.id);
  @override
  State<_ButtonWidget> createState() => _ButtonWidgetState();
  final FriendRepository friendRepository = FriendRepository();
  final String id;
}

class _ButtonWidgetState extends State<_ButtonWidget>{

  late Widget displayedWidget;
  late String id = widget.id;

  @override
  void initState(){
    super.initState();
    changeWidget0();
  }

  void sentRequest()async{
    changeWiget1();
    await widget.friendRepository.setRequestFriend(id);
  }
  void cancelRequest()async{
    changeWidget0();
    await widget.friendRepository.delRequestFriend(id);
  }
  
  void changeWidget0(){
    setState(() {
      displayedWidget = Row(
        children: [
          TextButtonWidget(buttonText: 'Add friend', textColor: WHITE, backgroundColor: FBBLUE,
              radiusRoundBorder : 5,
              onPressed: () async {
                await widget.friendRepository.setRequestFriend(id);
                sentRequest();
              }),
          TextButtonWidget(buttonText: 'Remove', textColor: BLACK, backgroundColor: GREY,
              radiusRoundBorder : 5, paddingLeft: 10,
              onPressed: (){
                handleDelSuggestion(context, id);
              }),
        ],
      );
    });
  }
  void changeWiget1(){
    setState(() {
      displayedWidget = Row(
        children: [
          const TextWidget(text: "Sent", fontSize: 10, width: 50,),
          TextButtonWidget(buttonText: 'Cancel', textColor: BLACK,
              backgroundColor: GREY,radiusRoundBorder : 5,
              onPressed: () async {
                cancelRequest();
                await widget.friendRepository.delRequestFriend(id);
              })
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return displayedWidget;
  }
}

void handleDelSuggestion(BuildContext context, String id) {
  final _SuggestionListState? listState = context.findAncestorStateOfType<_SuggestionListState>();
  listState?.removeItem(id);
}