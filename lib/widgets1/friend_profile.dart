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
          title: Text('Facebook Friend Profile'),
        ),
        body: const MyFriendProfile(
          avatarUrl:
              'https://it4788.catan.io.vn/files/avatar-1702051303359-135313063.jpg', // Replace with your avatar URL
          friendName:
              'Neymar Junior Dos Santos Lionel Ibrahimovic', // Replace with the friend's name
        ),
      ),
    );
  }
}

class MyFriendProfile extends StatelessWidget {
  final String avatarUrl;
  final String friendName;

  const MyFriendProfile({
    super.key,
    required this.avatarUrl,
    required this.friendName,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              11.0,
            ), // Adjust the radius for rounded corners
            child: Container(
              width: 72.0,
              height: 72.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0, // Border width
                ),
                color: Colors.grey, // Background color of the square
                borderRadius:
                    BorderRadius.circular(11.0), // Same radius as ClipRRect
                image: DecorationImage(
                  image: NetworkImage(avatarUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            width: 72.0, // Adjust the width based on your avatar width
            child: Text(
              friendName,
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
