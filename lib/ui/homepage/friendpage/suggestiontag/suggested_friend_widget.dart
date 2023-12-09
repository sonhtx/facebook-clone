import 'package:anti_fb/api/friend/friend_api.dart';
import 'package:flutter/material.dart';

class SuggestedFriendWidget extends StatefulWidget {
  final String id;
  final String username;
  final String avatar;
  final String created;
  final String sameFriend;

  const SuggestedFriendWidget(
      this.id, this.username, this.avatar, this.created, this.sameFriend,
      {super.key});

  @override
  State<StatefulWidget> createState() {
    return _SuggestFriendWidget();
  }
}

class _SuggestFriendWidget extends State<SuggestedFriendWidget> {
  bool isRequested = false;
  @override
  Widget build(BuildContext context) {
    void handleAddFriend() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: Text(
                'Do you want to send a friend request to ${widget.username}?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isRequested = true;
                  });
                  // Perform the accept action
                  // FriendApi friendApi = FriendApi();
                  // friendApi.setAcceptFriend(widget.id, "1");
                  // print('send a friend request to ${widget.username}');
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Accept'),
              ),
            ],
          );
        },
      );
    }

    void handleDelSuggestion() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: Text(
                'Do you want to delete the friend request from ${widget.username}?'),
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
                    widget.id,
                  );
                  // showBottomSheetMenu(context);
                  print('deleted request from ${widget.username}');
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Accept'),
              ),
            ],
          );
        },
      );
    }

    Widget suggestBtns = Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(5.0)),
          child: TextButton(
            onPressed: () {
              handleAddFriend();
            },
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              backgroundColor: Colors.blue, // Màu nền của nút
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: const Text(
              'Add friend',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5.0)),
          child: TextButton(
            onPressed: handleDelSuggestion,
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              backgroundColor: Colors.grey[300], // Màu nền của nút
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: const Text('Remove',
                style: TextStyle(color: Colors.black, fontSize: 15.0)),
          ),
        ),
      ],
    );

    if (isRequested) {
      suggestBtns = Row(
        children: <Widget>[
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5.0)),
            child: TextButton(
              onPressed: () {
                // Xử lý khi nút được nhấn
                // Ví dụ: Gọi hàm để thêm bạn bè
                // addFriend();
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Cancel',
                  style: TextStyle(color: Colors.black, fontSize: 15.0)),
            ),
          ),
        ],
      );
    }

    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatar),
            radius: 40.0,
          ),
          const SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.username,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15.0),
              suggestBtns,
            ],
          )
        ],
      ),
    );
  }
}
