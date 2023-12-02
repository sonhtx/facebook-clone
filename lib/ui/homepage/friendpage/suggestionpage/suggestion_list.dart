
import 'package:anti_fb/models/friend/FriendSuggestion.dart';
import 'package:anti_fb/repository/friend/friend_repo.dart';
import 'package:anti_fb/widgets/TextButtonWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


class SuggestionList extends StatefulWidget {

  const SuggestionList({super.key});

  @override
  State<SuggestionList> createState() => _SuggestionListState();
}

class _SuggestionListState extends State<SuggestionList> {
  final FriendRepository _friendSuggestionRepository = FriendRepository();

  late List<SuggestionWidget> suggestionWidgetList = [] ;

  Future<void> getFriendSuggest() async {
    try {
      List<FriendSuggestion>? listSuggest =
      await _friendSuggestionRepository.getfriendsuggestion('0', '5');
      for (int i = 0; i < listSuggest!.length; i++) {
        FriendSuggestion curSuggest = listSuggest[i];
        suggestionWidgetList.add(SuggestionWidget(
          curSuggest.id, curSuggest.username, curSuggest.avatar, curSuggest.same_friends
        ));
      }
    } catch (e){
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() { getFriendSuggest();});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: suggestionWidgetList
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
                Row(
                  children: [
                    TextButtonWidget(buttonText: 'Add friend', textColor: WHITE, backgroundColor: FBBLUE,
                        radiusRoundBorder : 5,
                        onPressed: (){

                        }),
                    TextButtonWidget(buttonText: 'Remove', textColor: BLACK, backgroundColor: GREY,
                        radiusRoundBorder : 5, paddingLeft: 10,
                        onPressed: (){

                        }),
                    ],
                )
              ],
            ),
          ),
          // const Divider(height: 0.5, color: GREY, ),
        ],
      ),

    );

  }

}