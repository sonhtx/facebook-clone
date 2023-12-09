import 'package:anti_fb/api/friend/friend_api.dart';
import 'package:flutter/material.dart';

class FriendRequestWidget extends StatelessWidget {
  final String id;
  final String username;
  final String avatar;
  final String created;

  const FriendRequestWidget(this.id, this.username, this.avatar, this.created,
      {super.key});

  String calculateTimeDifference(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    // Xác định xem có phải là "ngày trước", "tháng trước", hay "năm trước"
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

  @override
  Widget build(BuildContext context) {
    void handleAccept() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: Text(
                'Do you want to accept the friend request from $username?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Perform the accept action
                  FriendApi friendApi = FriendApi();
                  friendApi.setAcceptFriend(id, "1");
                  print('Accepted friend request from $username');
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Accept'),
              ),
            ],
          );
        },
      );
    }

    void handleDelRequest() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: Text(
                'Do you want to delete the friend request from $username?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Perform the accept action
                  FriendApi friendApi = FriendApi();
                  friendApi.delRequestFriend(
                    id,
                  );
                  showBottomSheetMenu(context);
                  print('deleted request from $username');
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Accept'),
              ),
            ],
          );
        },
      );
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 40.0,
          ),
          const SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    calculateTimeDifference(created),
                    style: const TextStyle(
                        fontSize: 10.0, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: TextButton(
                      onPressed: handleAccept,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: TextButton(
                      onPressed: () {
                        // Handle button press
                        handleDelRequest();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35.0, vertical: 10.0),
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void showBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return Container(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  // Handle Option 1
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.person_off_rounded,
                        size: 22.0, // Kích thước của biểu tượng
                        color: Colors.black, // Màu của biểu tượng
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Report or give feedback',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'A won\'t be notified',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
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
              GestureDetector(
                onTap: () {
                  // Handle Option 1
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.person_remove_outlined,
                        size: 22.0, // Kích thước của biểu tượng
                        color: Colors.black, // Màu của biểu tượng
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Block A',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'A won\'t be able to see you or contact you on Facebook',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.normal,
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
