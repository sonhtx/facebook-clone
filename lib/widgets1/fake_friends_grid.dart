import 'package:anti_fb/widgets1/friend_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Friends List'),
        ),
        body: FriendsGrid(),
      ),
    );
  }
}

class FriendsGrid extends StatelessWidget {
  List<String> friendId = [];
  List<String> avatar = [];
  List<String> username = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 25.0,
      ),
      itemCount: 6, // Number of friends
      itemBuilder: (BuildContext context, int index) {
        return const FriendItem(
          friendId: '180',
          avatarUrl:
              "https://it4788.catan.io.vn/files/avatar-1702051303359-135313063.jpg", // Replace with your avatar URL
          friendName: "Hoang Tran Nguyen Xuan Ha Thu Dong Son",
        );
      },
    );
  }
}
