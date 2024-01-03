import 'package:anti_fb/ui/profile/friend_profile.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FriendProfile(
              userId: friendId,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: WHITE,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: GREY.withOpacity(0.5),
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
                height: 115,
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
            const SizedBox(height: 8.0),
            Text(
              '$friendName',
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FONTBOLD,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
