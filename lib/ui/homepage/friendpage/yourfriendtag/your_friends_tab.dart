import 'package:anti_fb/constants.dart';
import 'package:anti_fb/models/friend/UserFriend.dart';
import 'package:anti_fb/repository/friend/friend_repo.dart';
import 'package:anti_fb/storage.dart';
import 'package:anti_fb/ui/homepage/friendpage/yourfriendtag/user_friend_widget.dart';
import 'package:anti_fb/widgets/icon/IconSearchWidget.dart';
import 'package:flutter/material.dart';

class YourFriendsTab extends StatefulWidget {
  YourFriendsTab({super.key});

  final FriendRepository _friendRepository = FriendRepository();
  late List<UserFriendWidget> userWidgetList;

  @override
  State<StatefulWidget> createState() {
    return _YourFriendsTabState();
  }
}

class _YourFriendsTabState extends State<YourFriendsTab> {
  String countFriends = "0";
  List<UserFriendWidget> userWidgetListDisplay = [];

  @override
  void initState() {
    super.initState();
    widget.userWidgetList = [];
    getFriendSuggest();
  }

  void delWhenBlockOrUnfriend(String id) {
    setState(() {
      widget.userWidgetList.removeWhere((element) => element.id == id);
      countFriends = widget.userWidgetList.length.toString();
      userWidgetListDisplay = widget.userWidgetList;
    });
  }

  Future<void> getFriendSuggest() async {
    try {
      String userId = (await getId())!;
      List<dynamic> result =
          await widget._friendRepository.getUserFriend('0', '5', userId);

      List<UserFriend>? listSuggest = result[0];
      countFriends = result[1];
      setState(() {
        widget.userWidgetList = listSuggest
                ?.map((curSuggest) => UserFriendWidget(
                    curSuggest.id,
                    curSuggest.username,
                    curSuggest.avatar,
                    curSuggest.created,
                    curSuggest.same_friends,
                    delWhenBlockOrUnfriend))
                .toList() ??
            [];

        userWidgetListDisplay = widget.userWidgetList;
      });
    } catch (e) {
      print("error fetching user friends");
      print(e);
    }
  }

  void handlePressedSort() {
    showBottomSheetMenu(context);
  }

  void sortUserWidgetList(bool ascending) {
    setState(() {
      userWidgetListDisplay.sort((a, b) {
        // Chuyển đổi ngày tạo thành đối tượng DateTime để so sánh
        DateTime dateA = DateTime.parse(a.created);
        DateTime dateB = DateTime.parse(b.created);

        return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
    });
  }

  void sortDefaultUserWightList() {
    setState(() {
      userWidgetListDisplay = widget.userWidgetList;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh no ... nothing here!',
            // style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            //       color: Theme.of(context).colorScheme.onBackground,
            // ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different catogory',
            // style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //       color: Theme.of(context).colorScheme.onBackground,
            // ),
          ),
        ],
      ),
    );
    if (userWidgetListDisplay.isNotEmpty) {
      content = Column(
        children: [
          for (int i = 0; i < userWidgetListDisplay.length; i++)
            userWidgetListDisplay[i],
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Friends',
          style: TextStyle(
            color: BLACK,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: WHITE,
        iconTheme: const IconThemeData(
          color: BLACK, // Màu của biểu tượng (mũi tên back)
        ),
        elevation: 0.0,
        actions: [
          IconSearchWidget(
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$countFriends Friends',
                    style: const TextStyle(
                        fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      handlePressedSort();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white, // Màu chữ của nút
                      padding: EdgeInsets.zero, // Bỏ padding
                      minimumSize: Size(0, 0), // Bỏ kích thước tối thiểu
                      alignment: Alignment.center, // Canh giữa văn bản
                    ),
                    child: const Text(
                      'Sort',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              content,
            ],
          ),
        ),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(builderContext);
                  sortDefaultUserWightList();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Colors.white, // Màu nền của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide.none, // Loại bỏ border
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 22.0, // Kích thước của biểu tượng
                        color: Colors.black, // Màu của biểu tượng
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Default",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(builderContext);
                  sortUserWidgetList(true);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Colors.white, // Màu nền của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide.none, // Loại bỏ border
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.align_vertical_top,
                        size: 22.0, // Kích thước của biểu tượng
                        color: Colors.black, // Màu của biểu tượng
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Newest friends first",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(builderContext);
                  sortUserWidgetList(false);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8.0),
                  backgroundColor: Colors.white, // Màu nền của nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: BorderSide.none, // Loại bỏ border
                ),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.align_vertical_bottom_sharp,
                        size: 22.0, // Kích thước của biểu tượng
                        color: Colors.black, // Màu của biểu tượng
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Oldest friends first",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
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
