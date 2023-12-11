import 'package:anti_fb/ui/homepage/friendpage/requested_friend_widget.dart';
import 'package:anti_fb/widgets/TextButtonWidget.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/friend/Friend.dart';
import '../../../repository/friend/friend_repo.dart';
import '../../../widgets/icon/IconSearchWidget.dart';
import '../home_screen.dart';

// show people can be friend

class PeoplePage extends StatelessWidget{
  const PeoplePage({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('Friends',style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
            backgroundColor: WHITE,
            elevation: 0.0,
            actions: [
              IconSearchWidget( onPressed: (){Navigator.pushNamed(context, '/search');},)
            ],
          ),
          SliverToBoxAdapter(
              child: Column(
                  children: [
                    const Divider(height: 0.5, color: GREY, ),
                    Container(
                      height: 50,
                      color: WHITE,
                      child: Row(
                        children: [
                          TextButtonWidget(buttonText: 'Suggestions', textColor: BLACK, paddingLeft : 10, backgroundColor: GREY.shade100, paddingTop: 0, radiusRoundBorder: 15.0,
                              onPressed: () {
                                final HomeState? homeState = context.findAncestorStateOfType<HomeState>();
                                homeState?.gotoSuggestion();

                              }),
                          TextButtonWidget(buttonText: 'Your friends',textColor: BLACK, paddingLeft : 10, backgroundColor: GREY.shade100, paddingTop: 0, radiusRoundBorder: 15.0,
                              onPressed: (){
                                // final HomeState? homeState = context.findAncestorStateOfType<HomeState>();
                                // homeState?.gotoSuggestion();
                                final HomeState? homeState = context.findAncestorStateOfType<HomeState>();
                                homeState?.gotoFriend();
                              })
                        ],
                      ),
                    )
                  ]
              )
          ),
          SliverList( delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height :50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: 'Friend requests', fontSize: 16, width: 200, paddingLeft: 15,),
                      TextWidget(text: 'See all', fontSize: 16, textColor: FBBLUE, width: 60, fontWeight: FontWeight.normal,),
                    ],
                  ),
                ),
                ListFriendReqWidget()
              ]
          ))
        ]
    );
  }

}


class ListFriendReqWidget extends StatefulWidget {

  ListFriendReqWidget({super.key});

  final FriendRepository _friendRepository = FriendRepository();
  late List<FriendRequestWidget> requestWidgetList = [];

  @override
  State<ListFriendReqWidget> createState() => ListFriendReqWidgetState();
}

class ListFriendReqWidgetState extends State<ListFriendReqWidget> {
  String countRequest = '0';

  @override
  void initState() {
    super.initState();
    widget.requestWidgetList = [];
    getFriendSuggest();
  }

  void removeItem(String id){
    setState(() {
      widget.requestWidgetList.removeWhere((obj) => obj.id == id);
    });
  }

  Future<void> getFriendSuggest() async {
    try {
      List<dynamic> result =
      await widget._friendRepository.getRequestedFriend('0', '5');

      List<Friend>? listSuggest = result[0];
      countRequest = result[1];
      setState(() {
        widget.requestWidgetList = listSuggest
            ?.map((curSuggest) => FriendRequestWidget(
          curSuggest.id,
          curSuggest.username,
          curSuggest.avatar,
          curSuggest.created,
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
    if (widget.requestWidgetList.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < widget.requestWidgetList.length; i++)
            widget.requestWidgetList[i],
        ],
      );
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: widget.requestWidgetList,
      ));
  }
}



















