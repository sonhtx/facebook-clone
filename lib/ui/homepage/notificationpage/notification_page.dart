import 'package:anti_fb/ui/homepage/notificationpage/user_notification.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/IconWidget.dart';
import 'NotificationWidget.dart';


class NotificationPage extends StatelessWidget{
  final ScrollController scrollController;
  const NotificationPage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              title: const NotificationsAppBarTitle(),
              actions:  [
                Row(
                  children: [
                    IconWidget(icon: Icons.settings, onPressed: () {},),
                    Padding(
                        padding: const EdgeInsets.only(right: 5), //
                        child: IconWidget( icon: Icons.search,
                          onPressed: (){},
                        )
                    ),
                  ],
                ),
              ],
              backgroundColor: WHITE,
              floating: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate( [
                  for(UserNotification notification in notifications) NotificationWidget(notification: notification)
                ]
                )
            ),
          ]
        ),
      ),
    );
  }

}

class NotificationsAppBarTitle extends StatelessWidget {
  const NotificationsAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: const Text( 'Notifications', style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
          )
        ]
    );
  }
}