import 'package:flutter/material.dart';

class SavedSearchWidget extends StatefulWidget {
  final String id;
  final String created;
  final String keyword;

  const SavedSearchWidget(this.id, this.keyword, this.created, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchResultWidget();
  }
}

class _SearchResultWidget extends State<SavedSearchWidget> {
  bool isRequested = false;
  @override
  Widget build(BuildContext context) {
    // void handleAddFriend() {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('Confirmation'),
    //         content: Text(
    //             'Do you want to send a friend request to ${widget.username}?'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop(); // Close the dialog
    //             },
    //             child: const Text('Cancel'),
    //           ),
    //           TextButton(
    //             onPressed: () {
    //               setState(() {
    //                 isRequested = true;
    //               });
    //               // Perform the accept action
    //               // FriendApi friendApi = FriendApi();
    //               // friendApi.setAcceptFriend(widget.id, "1");
    //               // print('send a friend request to ${widget.username}');
    //               Navigator.of(context).pop(); // Close the dialog
    //             },
    //             child: const Text('Accept'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    // void handleDelSuggestion() {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('Confirmation'),
    //         content: Text(
    //             'Do you want to delete the friend request from ${widget.username}?'),
    //         actions: <Widget>[
    //           TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop(); // Close the dialog
    //             },
    //             child: const Text('Cancel'),
    //           ),
    //           TextButton(
    //             onPressed: () {
    //               // Perform the accept action
    //               FriendApi friendApi = FriendApi();
    //               friendApi.delRequestFriend(
    //                 widget.id,
    //               );
    //               // showBottomSheetMenu(context);
    //               print('deleted request from ${widget.username}');
    //               Navigator.of(context).pop(); // Close the dialog
    //             },
    //             child: const Text('Accept'),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    // Widget suggestBtns = Row(
    //   children: <Widget>[
    //     Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
    //       decoration: BoxDecoration(
    //           color: Colors.blue, borderRadius: BorderRadius.circular(5.0)),
    //       child: TextButton(
    //         onPressed: () {
    //           handleAddFriend();
    //         },
    //         style: TextButton.styleFrom(
    //           padding:
    //               const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    //           backgroundColor: Colors.blue, // Màu nền của nút
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(5.0),
    //           ),
    //         ),
    //         child: const Text(
    //           'Add friend',
    //           style: TextStyle(color: Colors.white, fontSize: 15.0),
    //         ),
    //       ),
    //     ),
    //     const SizedBox(width: 10.0),
    //     Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
    //       decoration: BoxDecoration(
    //           color: Colors.grey[300],
    //           borderRadius: BorderRadius.circular(5.0)),
    //       child: TextButton(
    //         onPressed: handleDelSuggestion,
    //         style: TextButton.styleFrom(
    //           padding:
    //               const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    //           backgroundColor: Colors.grey[300], // Màu nền của nút
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(5.0),
    //           ),
    //         ),
    //         child: const Text('Remove',
    //             style: TextStyle(color: Colors.black, fontSize: 15.0)),
    //       ),
    //     ),
    //   ],
    // );

    // if (isRequested) {
    //   suggestBtns = Row(
    //     children: <Widget>[
    //       Container(
    //         padding:
    //             const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
    //         decoration: BoxDecoration(
    //             color: Colors.grey[300],
    //             borderRadius: BorderRadius.circular(5.0)),
    //         child: TextButton(
    //           onPressed: () {
    //             // Xử lý khi nút được nhấn
    //             // Ví dụ: Gọi hàm để thêm bạn bè
    //             // addFriend();
    //           },
    //           style: TextButton.styleFrom(
    //             padding: const EdgeInsets.symmetric(
    //                 horizontal: 15.0, vertical: 10.0),
    //             backgroundColor: Colors.grey[300],
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(5.0),
    //             ),
    //           ),
    //           child: const Text('Cancel',
    //               style: TextStyle(color: Colors.black, fontSize: 15.0)),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    return Container(
      // height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.search_rounded,
            size: 22.0, // Kích thước của biểu tượng
            color: Colors.black, // Màu của biểu tượng
          ),
          const SizedBox(width: 20.0),
          Text(
            widget.keyword,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
