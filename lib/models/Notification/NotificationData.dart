import 'NotificationFeelData.dart';
import 'NotificationMarkData.dart';
import 'NotificationPostData.dart';
import 'NotificationUserData.dart';

class NotificationData{
  final String type;
  final String object_id;
  final String title;
  final String notification_id;
  final String created;
  final String? avatar;
  final String group;
  final String read;
  final NotificationUserData? user;
  final NotificationPostData? post;
  final NotificationMarkData? mark;
  final NotificationFeelData? feel;

  NotificationData({required this.type, required this.object_id, required this.title, required this.notification_id, required this.created, required this.avatar, required this.group, required this.read, required this.user, required this.post, required this.mark, required this.feel});

  factory NotificationData.fromJson(Map<String, dynamic> json){
    NotificationUserData? user;
    NotificationPostData? post;
    NotificationMarkData? mark;
    NotificationFeelData? feel;
    if(json['user'] != null){
      user = NotificationUserData.fromJson(json['user']);
    }
    if(json['post'] != null){
      post = NotificationPostData.fromJson(json['post']);
    }
    if(json['mark'] != null){
      mark = NotificationMarkData.fromJson(json['mark']);
    }
    if(json['feel'] != null){
      feel = NotificationFeelData.fromJson(json['feel']);
    }
    return NotificationData(
        type: json['type'] as String,
        object_id: json['object_id'] as String,
        title: json['title'] as String,
        notification_id: json['notification_id'] as String,
        created: json['created'] as String,
        avatar: json['avatar'] as String,
        group: json['group'] as String,
        read: json['read'] as String,
        user: user,
        post: post,
        mark: mark,
        feel: feel);
  }
}