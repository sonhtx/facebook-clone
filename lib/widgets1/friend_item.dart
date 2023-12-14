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
        body: const FriendItem(
          friendId: '338',
          avatarUrl:
              'https://it4788.catan.io.vn/files/avatar-1702051303359-135313063.jpg', // Replace with your avatar URL
          friendName:
              'Neymar Junior Dos Santos Lionel Ibrahimovic', // Replace with the friend's name
        ),
      ),
    );
  }
}

class FriendItem extends StatelessWidget {
  final String friendId;
  final String avatarUrl; // Nullable, fix later
  final String? friendName;

  const FriendItem({
    super.key,
    required this.friendId,
    required this.avatarUrl,
    required this.friendName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle friend item click
        print('Friend $friendId clicked!');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(
                11.0,
              ), // Adjust the radius for rounded corners
              child: Container(
                width: 95.0,
                height: 98.5,
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
            const SizedBox(height: 8.0),
            Text(
              '$friendName',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
