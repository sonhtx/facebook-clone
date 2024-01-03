import 'package:flutter/material.dart';

import '../constants.dart';

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
                color: GREY, // Background color of the square
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
                fontWeight: FONTBOLD,
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
