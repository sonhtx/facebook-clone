import 'package:anti_fb/widgets/TextButtonWidget.dart';
import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/icon/IconSearchWidget.dart';
import '../../../widgets/icon/IconSettingWidget.dart';

// show people can be friend

class PeoplePage extends StatelessWidget{
  const PeoplePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends',style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
        backgroundColor: WHITE,
        elevation: 0.0,
        actions: const [
          IconSearchWidget()
        ],
      ),

      body: Column(

          children: [
            const Divider(height: 0.5, color: GREY, ),
            Container(
              height: 50,
              color: WHITE,
              child: Row(
                children: [
                  TextButtonWidget(buttonText: 'Suggestions', textColor: BLACK, paddingLeft : 10, backgroundColor: GREY.shade100, paddingTop: 0, radiusRoundBorder: 15.0,
                      onPressed: (){

                      }),
                  TextButtonWidget(buttonText: 'Your friends',textColor: BLACK, paddingLeft : 10, backgroundColor: GREY.shade100, paddingTop: 0, radiusRoundBorder: 15.0,
                      onPressed: (){
                      })
                ],
              ),
            ),
            // const Divider(height: 0.2, color: GREY, ),
            Container(
              padding: const EdgeInsets.all(0),
              child : Column(
                children: [
                  SizedBox(
                    height :50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(text: 'Friend requests', fontSize: 16, width: 200, paddingLeft: 15,),
                        TextWidget(text: 'See all', fontSize: 16, textColor: FBBLUE, width: 60, fontWeight: FontWeight.normal,),

                      ],
                    ),
                  ),

                  ListFriendReqWidget(),
                ]
                
              )
            )
          ]
        ),
    );
  }

}


class ListFriendReqWidget extends StatefulWidget {

  const ListFriendReqWidget({super.key});

  @override
  State<ListFriendReqWidget> createState() => _ListFriendReqWidgetState();
}

class _ListFriendReqWidgetState extends State<ListFriendReqWidget> {
  late List<Widget> listFriendReq = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      listFriendReq.add(FriendReqWidget());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: GREY,
        child: Column( children: listFriendReq,)
    );
  }
}


class FriendReqWidget extends StatefulWidget {

  @override
  State<FriendReqWidget> createState() => _FriendReqWidgetState();

}

class _FriendReqWidgetState extends State<FriendReqWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(

    );
  }

}



















