import 'dart:convert';

import 'package:anti_fb/api/friend/friend_api.dart';
import 'package:anti_fb/models/post/PostListData.dart';
import 'package:anti_fb/ui/homepage/homepage/listpost.dart';
import 'package:anti_fb/ui/profile/profile_screen.dart';
import 'package:anti_fb/widgets1/friends_grid.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/models/info.dart';
import 'package:anti_fb/constants.dart';
import 'package:anti_fb/storage.dart';
import 'package:anti_fb/api/profile/profile_api.dart';
import 'package:anti_fb/api/profile/userinfo_api.dart';
import 'package:anti_fb/models/User.dart';
import 'package:anti_fb/widgets1/friend_grid_view.dart';
import 'package:anti_fb/widgets1/custom_button.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FriendProfile(userId: "794"),
    );
  }
}

class FriendProfile extends StatefulWidget {
  const FriendProfile({required this.userId, Key? key}) : super(key: key);

  final String userId;

  @override
  State<FriendProfile> createState() => _FriendProfileState();
}

class _FriendProfileState extends State<FriendProfile> {
  late String email;
  late String token;
  late User user;
  late List<Info> info;
  late String friendsCount;
  late FriendsGrid friendsGrid;
  late String myId;
  List<PostListData> postlists = [];
  int buttonCase = 0;

  Widget infoTemplate(infoItem, context) {
    return Row(
      children: [
        infoItem.icon,
        const SizedBox(
          width: 5,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 50.0,
          padding: const EdgeInsets.all(5),
          child: RichText(
              text: TextSpan(style: const TextStyle(fontSize: 18), children: [
            TextSpan(
                text: infoItem.normalText,
                style: const TextStyle(color: Colors.black)),
            TextSpan(
                text: infoItem.boldText,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))
          ])),
        ),
      ],
    );
  }

  // Init data use for API calling
  Future<void> fetchData() async {
    // fix this to your actual email
    email = 'sonacc2@gmail.com';
    // For testing purpose only, delete after merging
    String testToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Nzk0LCJkZXZpY2VfaWQiOiJzdHJpbmciLCJpYXQiOjE3MDQxODk1NzV9.Gj8HqP59QQEYeUILTD-kwZK1yNsuifBT9EFB5Y2nmcg';
    String testId = '794';
    //await deleteAllSecureStorageData();
    // await storage.write(key: 'token', value: testToken);
    // await storage.write(key: 'id', value: testId);
    // await storage.write(key: 'email', value: email);
    String userId = widget.userId;

    // get token and email from storage
    token = (await getJwt())!;
    email = (await getEmail())!;

    // get current user (user who is currently log in) id
    // await storage.write(key: 'id', value: testId);
    myId = (await getId())!;

    UserInfoApi uia = UserInfoApi();
    Map<String, dynamic> userInfo = await uia.getUserInfo(userId);

    // handle button case here
    buttonCase = await uia.getFriendStatus(userId);
    print(userInfo);

    user = User.fromJson(userInfo);
    print(user.username);
    info = [
      Info(
        icon: const Icon(
          Icons.location_on,
          color: Colors.black,
        ),
        normalText: 'From ',
        boldText: "${user.address}, ${user.city}, ${user.country}",
      ),
      Info(
        icon: const Icon(Icons.link, color: Colors.black),
        normalText: user.link,
        boldText: '',
      ),
      Info(
        icon: const Icon(Icons.more_horiz, color: Colors.black),
        normalText: 'See your About info',
      ),
    ];

    FriendApi friendApi = FriendApi();
    Map<String, dynamic> userFriends =
        await friendApi.getUserFriends("0", "150", userId);
    friendsCount = userFriends['data']['total'];
    print(friendsCount);

    // friendsGrid.friends
    List<dynamic> top6Friends = userFriends['data']['friends'];
    friendsGrid = FriendsGrid();
    for (int i = 0; i < min(6, top6Friends.length); i++) {
      friendsGrid.friendId.add(top6Friends[i]['id']);
      friendsGrid.avatar.add(top6Friends[i]['avatar']);
      friendsGrid.username.add(top6Friends[i]['username']);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget boundary = const Divider(
      thickness: 1,
      height: 10,
      color: Color.fromARGB(255, 183, 176, 176),
    );

    Widget bigBoundary = const Divider(
      thickness: 20,
      height: 100,
      color: Color.fromARGB(255, 211, 206, 206),
    );

    Widget endline = const SizedBox(
      height: 10,
    );

    Widget endline5 = const SizedBox(
      height: 5,
    );

    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the future is still running, show a loading indicator
          print("Waiting..");
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If there's an error, display an error message
          print("Error: ${snapshot.error}");
          return Text('Error: ${snapshot.error}');
        } else {
          // When the future is complete, use the result to build the widget
          // String data = snapshot.data as String;
          print("Finished");

          if (buttonCase == -1) {
            return const Text(
              "You're navigate to an unexisted user.",
            );
          }

          if (buttonCase == 4) {
            return const Text(
              "You can't see this profile because of blocking issue.",
            );
          }

          if (myId == widget.userId) {
            return const Profile();
          }

          Widget button;
          Widget button1;
          FriendApi fapi = FriendApi();

          // Handle button & button1
          switch (buttonCase) {
            // Not friend yet
            case 0:
              button = CustomButton(
                text: 'Add friend',
                icon: Icons.person_add,
                onPressed: () {
                  fapi.setRequestFriend(widget.userId);
                  setState(() {
                    buttonCase = 2;
                  });
                  // Handle send friend request
                  print('Friend request sent.');
                },
                color: FBBLUE, // Set the button color here
              );
              button1 = CustomButton(
                text: 'Block',
                icon: Icons.clear,
                onPressed: () {
                  // Handle block here
                  fapi.setBlock(widget.userId);
                  setState(() {
                    buttonCase = 4;
                  });
                  print('''You've blocked this user.''');
                },
                color: Colors.red[800],
              );
              break;
            // Friend already
            case 1:
              button = CustomButton(
                text: 'Friends',
                icon: Icons.done_outlined,
                onPressed: () {
                  setState(() {});
                  buttonCase = 1;
                  print('Button pressed!');
                },
                color: FBBLUE, // Set the button color here
              );
              button1 = CustomButton(
                text: 'Unfriend',
                icon: Icons.person_remove,
                onPressed: () {
                  // Handle unfriend here
                  fapi.unFriend(widget.userId);
                  setState(() {
                    buttonCase = 0;
                  });
                  print('''You've unfriended this user.''');
                },
                color: Colors.red[800],
              );
              break;
            // Friend request sent
            case 2:
              button = CustomButton(
                text: 'Cancel request',
                icon: Icons.cancel,
                onPressed: () {
                  // Delete friend request here!!!!!
                  fapi.delRequestFriend(widget.userId);
                  setState(() {
                    buttonCase = 0;
                  });
                  print('Button pressed!');
                },
                color: FBBLUE, // Set the button color here
              );
              button1 = CustomButton(
                text: 'Delete request',
                icon: Icons.remove_circle,
                onPressed: () {
                  // Handle delete friend request here
                  fapi.delRequestFriend(widget.userId);
                  setState(() {
                    buttonCase = 0;
                  });
                  print('''You've unfriended this user.''');
                },
                color: Colors.red[800],
              );
              break;
            // Friend request received
            case 3:
              button = CustomButton(
                text: 'Confirm',
                icon: Icons.done,
                onPressed: () {
                  setState(() {
                    buttonCase = 1;
                  });
                  // Accept friend request here!!!!!
                  fapi.setAcceptFriend(widget.userId, "1");
                  print('Button pressed!');
                },
                color: FBBLUE, // Set the button color here
              );
              button1 = CustomButton(
                text: 'Block',
                icon: Icons.clear,
                onPressed: () {
                  // Handle block here
                  fapi.setBlock(widget.userId);
                  setState(() {
                    buttonCase = 4;
                  });
                  print('''You've blocked this user.''');
                },
                color: Colors.red[800],
              );
            default:
              button = CustomButton(
                text: 'Why this happened?',
                icon: Icons.error,
                onPressed: () {
                  setState(() {});
                  // Handle button press
                  print('''You've created an error''');
                },
                color: FBBLUE,
              );
              button1 = CustomButton(
                text: 'Why this happened?',
                icon: Icons.remove_circle,
                onPressed: () {
                  setState(() {});
                  // Handle button1 press
                  print('''You've created an error''');
                },
                color: Colors.red[800],
              );
          }

          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                // constraints: const BoxConstraints.expand(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    // Background & avatar
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 180,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    user.coverImage,
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 80),
                          child: CircleAvatar(
                            radius: 74.0,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 70.0,
                              backgroundImage: user.avatar == ''
                                  ? const AssetImage(defaultAvatar)
                                      as ImageProvider<Object>?
                                  : CachedNetworkImageProvider(user.avatar),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 190),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 55,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Center(
                                  child: Container(
                                    width: 40.0, // Set the desired width
                                    height: 40.0,
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      icon: const Icon(Icons.camera_alt),
                                      iconSize: 20.0,
                                      color: Colors.white,
                                      onPressed: () {
                                        // Change avatar
                                        print('IconButton clicked!');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 250,
                            top: 140,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 55,
                              ),
                              const SizedBox(
                                width: 25,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Center(
                                  child: Container(
                                    width: 40.0, // Set the desired width
                                    height: 40.0,
                                    alignment: Alignment.center,
                                    child: IconButton(
                                      icon: const Icon(Icons.camera_alt),
                                      iconSize: 20.0,
                                      color: Colors.white,
                                      onPressed: () {
                                        // Change background image
                                        print('IconButton clicked!');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Username
                    Text(
                      user.username,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),

                    // Description
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        user.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 50, 47, 47)),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        button,
                        const SizedBox(
                          width: 10,
                        ),
                        // button1
                        button1,

                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),

                    endline,
                    boundary,
                    endline,

                    // User information
                    Column(
                      children: info
                          .map<Widget>(
                              (infoList) => infoTemplate(infoList, context))
                          .toList(),
                    ),

                    // Friend here
                    // Container(
                    //   child: MyGridView(),
                    // ),

                    endline,
                    boundary,
                    endline,

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Friends',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    endline5,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$friendsCount friends',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    friendsGrid,

                    bigBoundary,

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Posts',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // List posts here

                    ListPostWidget(
                      id: widget.userId,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
