import 'package:anti_fb/models/Notification/NotificationData.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../friendpage/Friends_page.dart';
import '../friendpage/yourfriendtag/your_friends_tab.dart';
import '../homepage/postpage/post_screen.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationData notification;

  const NotificationWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    int type = int.parse(notification.type);
    int group = int.parse(notification.group);
    return GestureDetector(
      onTap: (){
        print(type);
        if(type == 3){
          print(notification.post?.id);
        }
        if(group == 1){
            switch(type){
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>FriendsPage())
                );
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>YourFriendsTab())
                );
              default:
                if(notification.post != null){
                  Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(builder: (context) => PostScreen(
                    id: notification.post!.id,)));
                }
          }
        }
      },
      child: Container(
        color: (notification.read == 0) ? NOTREADNOTI : Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 100.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
              child: (notification.avatar != "" && notification.avatar != null)
                  ? CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(notification.avatar!),
                radius: 35.0,
              )
                  : const CircleAvatar(
                backgroundImage:
                AssetImage('assets/images/messi-world-cup.png'),
                radius: 35.0,
              ),
            ),
            // const SizedBox(width: 15.0),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: double.maxFinite,
                      child: Described(notification: notification)
                    ),
                    Text(
                        calculateTimeDifference(notification.created),
                        style:
                        const TextStyle(fontSize: 10.0, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            SizedBox(
              // width: MediaQuery.of(context).size.width * .10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  // Icon(Icons.more_horiz),
                  IconButton(
                      onPressed: (){
                        optionBottomSheet(context);
                      },
                      icon: const Icon(
                        Icons.more_horiz,)),
                  const Text(''),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void optionBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return SafeArea(
        child: Scaffold(
          body: Wrap(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 30.0),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: (notification.avatar != "" && notification.avatar != null)
                            ? CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(notification.avatar!),
                          radius: 35.0,
                        )
                            : const CircleAvatar(
                          backgroundImage: AssetImage(defaultAvatar),
                          radius: 35.0,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: Described(notification: notification)
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                              iconColor: Colors.black,
                              textStyle: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black
                              ),
                              maximumSize: Size(MediaQuery.of(context).size.width, 50.0),
                              minimumSize: Size(MediaQuery.of(context).size.width, 50.0),
                              alignment: Alignment.centerLeft,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0)
                              )
                          ),
                          onPressed: (){},
                          icon: const Icon(Icons.close),
                          label: const Text(
                            "Remove this notification",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class Described extends StatelessWidget {
  final NotificationData notification;
  const Described({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    int type = int.parse(notification.type);
    return RichText(
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: 3,
      text: TextSpan(
          text: (notification.user?.username == null)? "" : notification.user!.username,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0),
          children: [
            TextSpan(
              text:showContent(type),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
              fontWeight: FontWeight.normal),
            )
          ]),
    );
  }
  String feel_type(String type){
    if(type == "1"){
      return "like";
    }else{
      return "dislike";
    }
  }
  String showContent(int type){
    switch(type){
      case 1:
        return " sent you a friend request";
      case 2:
        return " accepted your friend request";
      case 3:
        if(notification.post?.status == ""){
          return " added a post: ${notification.post?.described}";
        }else{
          return " is feeling ${notification.post?.status}: ${notification.post?.described}";
        }
      case 4:
        return " updated post";
      case 5:
        return " ${feel_type(notification.feel!.type)} your post";
      case 6:
        return " marked your post: ${notification.mark!.mark_content}";
      case 7:
        return " commented your mark: ${notification.mark!.mark_content}";
      case 8:
        return " added a video";
      default:
        return " commented your post";
    }
  }
}
