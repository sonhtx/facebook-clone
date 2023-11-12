import 'package:flutter/material.dart';
import 'package:anti_fb/models/user_notification.dart';
import '../../widgets/NotificationWidget.dart';

class NotificationsTab extends StatelessWidget {

  final ScrollController scrollController;

  const NotificationsTab({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollController,
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