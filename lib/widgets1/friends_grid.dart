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
      itemCount: friendId.length, // Number of friends
      itemBuilder: (BuildContext context, int index) {
        return FriendItem(
          friendId: friendId[index],
          avatarUrl: avatar[index], // Replace with your avatar URL
          friendName: username[index],
        );
      },
    );
  }
}
