import 'package:anti_fb/widgets1/friend_profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:anti_fb/api/profile/profile_api.dart';
import 'package:anti_fb/api/profile/userinfo_api.dart';
import 'package:anti_fb/models/User.dart';
import 'package:anti_fb/storage.dart';
import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3, // 3 columns
      crossAxisSpacing: 10.0, // Spacing between columns
      mainAxisSpacing: 25.0, // Spacing between rows
      children: List.generate(
        6, // 2 rows x 3 columns
        (index) => const SizedBox(
          // Example background color
          child: Center(
            child: MyFriendProfile(
              avatarUrl:
                  'https://it4788.catan.io.vn/files/avatar-1702051303359-135313063.jpg',
              friendName: 'Hoang Tran Xuan Son',
            ),
          ),
        ),
      ),
    );
  }
}
