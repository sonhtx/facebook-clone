import 'package:anti_fb/widgets/AlertDialogWidget.dart';
import 'package:flutter/material.dart';

const CYAN = Colors.cyan;
const GREEN = Colors.green;
const BLUE = Colors.blue;
const FBBLUE = Color(0xFF1777F2);
const NOTREADNOTI = Color(0xffe6ffff);
const ONLINE = Color(0xFF4BCB1F);
const YELLOW = Colors.yellow;
const ORANGE = Colors.orange;
const WHITE = Colors.white;
const GREY = Colors.grey;
const RED = Colors.red;
const BLACK = Colors.black;
const TEXT = Color(0xFF757575);
const BG = Color(0xFFEFF1F5);
const BTNBG = Color(0xFFE5E4E9);

const TRANSPARENT = Colors.transparent;

const myPort = 33333;
const authUrl = "http://localhost:2400/api/auth";
const apiUrl = "https://it4788.catan.io.vn";


const defaultAvatar = "assets/images/default-avatar.jpg";

String calculateTimeDifference(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime);

  if (difference.inDays == 1) {
    return 'Yesterday';
  } else if (difference.inDays > 1 && difference.inDays <= 7) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays > 7 && difference.inDays <= 30) {
    int weeks = (difference.inDays / 7).floor();
    return '$weeks weeks ago';
  } else if (difference.inDays > 30 && difference.inDays <= 365) {
    int months = (difference.inDays / 30).floor();
    return '$months months ago';
  } else if (difference.inDays > 365) {
    int years = (difference.inDays / 365).floor();
    return '$years years ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hours ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minutes ago';
  } else {
    return 'Just now';
  }
}

void showNotification(BuildContext context, String title, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialogWidget(title: title, text: text);
    },
  );
}