import 'package:anti_fb/models/request/ReqListNotification.dart';
import 'package:anti_fb/repository/notification/notification_repo.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Notification/NotificationData.dart';
import '../../../widgets/IconWidget.dart';
import '../nav_screen.dart';
import 'NotificationWidget.dart';


class NotificationPage extends StatefulWidget{

  final List<NotificationData> notificationLists;
  final ScrollController scrollController;
  const NotificationPage({super.key, required this.scrollController, required this.notificationLists});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  
  late List<NotificationData> _notificationLists = [];
  
  late List<Widget> listNotificationWidget = [];
  
  final NotificationRepository _notificationRepository = NotificationRepository();
  
  static final RequestListNotification requestListNotification = RequestListNotification("0", "30");

  Future<void> getListNotification() async{
    await Future.delayed(const Duration(seconds: 2));

    try{
      List<NotificationData>? listNotification = await _notificationRepository.getListNotification(requestListNotification);

      setState(() {
        if(listNotification != null){
          _notificationLists = listNotification;
        }else{
        }

        if(mounted){
          final HomeState? homeState =
          context.findAncestorStateOfType<HomeState>();
          homeState?.notificationLists = _notificationLists;
        }
      });
    }catch(error){
      print(error);
    }
  }


  @override
  void initState() {
    super.initState();
    _notificationLists = widget.notificationLists;
    if(_notificationLists.isEmpty){
      getListNotification();
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: widget.scrollController,
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
                  for(NotificationData notification in _notificationLists) NotificationWidget(notification: notification)
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