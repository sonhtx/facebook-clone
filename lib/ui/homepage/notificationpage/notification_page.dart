import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/icon/IconSearchWidget.dart';
import '../../../widgets/icon/IconSettingWidget.dart';


class NotificationPage extends StatelessWidget{
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          title: NotificationsAppBarTitle(),
          actions:  [
            Row(
              children: [
                IconSettingWidget(),
                Padding(
                    padding: EdgeInsets.only(right: 5), //
                    child: IconSearchWidget()
                ),
              ],
            ),
          ],
          backgroundColor: WHITE,
          floating: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate( [




            ]
            )
        ),
      ]
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