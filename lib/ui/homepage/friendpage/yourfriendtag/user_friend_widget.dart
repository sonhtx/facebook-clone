import 'package:anti_fb/api/friend/friend_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../../../profile/friend_profile.dart';

class UserFriendWidget extends StatelessWidget {
  final String id;
  final String username;
  final String avatar;
  final String created;
  final String sameFriends;

  final Function(String id) delWhenBlockOrUnfriend;

  UserFriendWidget(this.id, this.username, this.avatar, this.created,
      this.sameFriends, this.delWhenBlockOrUnfriend,
      {super.key});

  var friendApi = FriendApi();

  String formatDate(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String formattedDate = DateFormat('MMMM yyyy').format(date);
    return 'Friends since $formattedDate';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FriendProfile(
              userId: id,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(avatar),
                    radius: 40.0,
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        username,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FONTBOLD,
                        ),
                      ),
                      Text(
                        '$sameFriends mutual friends',
                        style:
                            const TextStyle(fontSize: 14.0, fontWeight: FONTNORMAL),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: () {
                  // Handle the more_horiz button press
                  showBottomSheetMenu(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleBlock() {
    friendApi.setBlock(id);
    delWhenBlockOrUnfriend(id);
    print('blocked  $username');
  }

  void handleUnfriend() {
    friendApi.unFriend(id);
    delWhenBlockOrUnfriend(id);
    print('unfried  $username');
  }

  void showBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 2 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(builderContext);
                  // handleBlock();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: WHITE, // Màu nền của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide.none, // Loại bỏ border
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(avatar),
                            radius: 25.0,
                          ),
                          const SizedBox(width: 20.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                username,
                                style: const TextStyle(
                                    color: BLACK,
                                    fontSize: 16.0,
                                    fontWeight: FONTBOLD),
                              ),
                              Text(
                                formatDate(created),
                                style: const TextStyle(
                                    color: BLACK,
                                    fontSize: 14.0,
                                    fontWeight: FONTNORMAL),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(builderContext);
                  // handleBlock();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: WHITE, // Màu nền của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide.none, // Loại bỏ border
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.chat_outlined,
                        size: 22.0,
                        color: BLACK,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Message $username',
                        style: const TextStyle(
                            color: BLACK, fontSize: 14.0, fontWeight: FONTBOLD),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(builderContext);
                  handleBlock();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: WHITE, // Màu nền của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide.none, // Loại bỏ border
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.person_off_rounded,
                        size: 22.0, // Kích thước của biểu tượng
                        color: BLACK, // Màu của biểu tượng
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Block $username',
                            style: const TextStyle(
                                color: BLACK,
                                fontSize: 14.0,
                                fontWeight: FONTBOLD),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'A won\'t be able to see you or contact you on Facebook',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FONTNORMAL,
                                color: Color.fromARGB(197, 14, 13, 13)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(builderContext);
                  handleUnfriend();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: WHITE, // Màu nền của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide.none, // Loại bỏ border
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.person_remove_outlined,
                        size: 22.0, // Kích thước của biểu tượng
                        color: RED, // Màu của biểu tượng
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Unfriend $username',
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FONTBOLD,
                              color: RED,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Remove $username as a friend',
                            style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FONTNORMAL,
                                color: Color.fromARGB(197, 14, 13, 13)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
