import 'package:flutter/material.dart';
import 'package:anti_fb/models/user_notification.dart';
import '../../widgets/NotificationWidget.dart';

class NotificationsTab extends StatefulWidget {

  final ScrollController scrollController;

  const NotificationsTab({super.key, required this.scrollController});

  @override
  State<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 15.0),
                child: Text('Notifications', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
              ),

              const Divider(height: 10.0,thickness: 0.5),

              for(UserNotification notification in notifications) NotificationWidget(notification: notification)
            ],
          ),
        ),
      ),
    );
  }
}