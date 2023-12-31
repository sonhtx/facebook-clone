import 'package:anti_fb/constants.dart';
import 'package:anti_fb/models/request/ReqSetNotification.dart';
import 'package:flutter/material.dart';

import '../../../../../repository/setting/setting_repo.dart';

class DetailNotification extends StatefulWidget {
  final RequestSetNotification requestSetNotification;
  final int type;
  final bool state;
  const DetailNotification({super.key, required this.type, required this.state, required this.requestSetNotification});

  @override
  State<DetailNotification> createState() => _DetailNotificationState();
}

class _DetailNotificationState extends State<DetailNotification> {
  late RequestSetNotification requestSetNotification;
  final SettingRepository _settingRepository = SettingRepository();
  late String description;
  late String example;
  late bool state;

  String boolToString(bool state){
    if(state == true){
      return "1";
    }else{
      return "0";
    }
  }

  void content(int type){
    switch(type){
      case 1:
        setState(() {
          description = "These are notifications for comments and likes on your post and replies to your comment. Here's an example";
          example = " replied to a comment that you're tagged in";
        });
      case 2:
        setState(() {
          description = "These are notifications about your friend's activity when they update their status or share a photo. Here's an example";
          example = " update his status";
        });
      case 3:
        setState(() {
          description = "These are notifications when someone sends you a friend request or a request you've sent is accepted. Here's an example";
          example = " sent you a friend request";
        });
      case 4:
        setState(() {
          description = "These are notifications when someone you may know. Here's an example";
          example = " may be your acquaintance";
        });
      case 5:
        setState(() {
          description = "These are notifications about your friend's birthday. Here's an example";
          example = " has a birthday today";
        });
      case 6:
        setState(() {
          description = "These are notifications your friend post a video. Here's an example";
          example = " post a video";
        });
      default:
        setState(() {
          description = "These are notifications about your friend's birthday. Here's an example";
          example = " has a birthday today";
        });
    }
  }

  void setRequest(int type, String state){
    switch(type){
      case 1:
        setState(() {
          requestSetNotification = RequestSetNotification(
              state,
              requestSetNotification.from_friends,
              requestSetNotification.requested_friend,
              requestSetNotification.suggested_friend,
              requestSetNotification.birthday,
              requestSetNotification.video,
              requestSetNotification.report,
              requestSetNotification.sound_on,
              requestSetNotification.notification_on,
              requestSetNotification.vibrant_on,
              requestSetNotification.led_on
          );
        });
      case 2:
        setState(() {
          requestSetNotification = RequestSetNotification(
              requestSetNotification.like_comment,
              state,
              requestSetNotification.requested_friend,
              requestSetNotification.suggested_friend,
              requestSetNotification.birthday,
              requestSetNotification.video,
              requestSetNotification.report,
              requestSetNotification.sound_on,
              requestSetNotification.notification_on,
              requestSetNotification.vibrant_on,
              requestSetNotification.led_on
          );
        });
      case 3:
        setState(() {
          requestSetNotification = RequestSetNotification(
              requestSetNotification.like_comment,
              requestSetNotification.from_friends,
              state,
              requestSetNotification.suggested_friend,
              requestSetNotification.birthday,
              requestSetNotification.video,
              requestSetNotification.report,
              requestSetNotification.sound_on,
              requestSetNotification.notification_on,
              requestSetNotification.vibrant_on,
              requestSetNotification.led_on
          );
        });
      case 4:
        setState(() {
          requestSetNotification = RequestSetNotification(
              requestSetNotification.like_comment,
              requestSetNotification.from_friends,
              requestSetNotification.requested_friend,
              state,
              requestSetNotification.birthday,
              requestSetNotification.video,
              requestSetNotification.report,
              requestSetNotification.sound_on,
              requestSetNotification.notification_on,
              requestSetNotification.vibrant_on,
              requestSetNotification.led_on
          );
        });
      case 5:
        setState(() {
          requestSetNotification = RequestSetNotification(
              requestSetNotification.like_comment,
              requestSetNotification.from_friends,
              requestSetNotification.requested_friend,
              requestSetNotification.suggested_friend,
              state,
              requestSetNotification.video,
              requestSetNotification.report,
              requestSetNotification.sound_on,
              requestSetNotification.notification_on,
              requestSetNotification.vibrant_on,
              requestSetNotification.led_on
          );
        });
      case 6:
        setState(() {
          requestSetNotification = RequestSetNotification(
              requestSetNotification.like_comment,
              requestSetNotification.from_friends,
              requestSetNotification.requested_friend,
              requestSetNotification.suggested_friend,
              requestSetNotification.birthday,
              state,
              requestSetNotification.report,
              requestSetNotification.sound_on,
              requestSetNotification.notification_on,
              requestSetNotification.vibrant_on,
              requestSetNotification.led_on
          );
        });
      default:
        setState(() {
          requestSetNotification = RequestSetNotification(
              requestSetNotification.like_comment,
              requestSetNotification.from_friends,
              requestSetNotification.requested_friend,
              requestSetNotification.suggested_friend,
              requestSetNotification.birthday,
              requestSetNotification.video,
              state,
              requestSetNotification.sound_on,
              requestSetNotification.notification_on,
              requestSetNotification.vibrant_on,
              requestSetNotification.led_on
          );
        });
    }
  }

  @override
  void initState() {
    super.initState();
    requestSetNotification = widget.requestSetNotification;
    state = widget.state;
    content(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Notification Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      description,
                      style: const TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  )),
            ),
            Example(example: example),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.95,
              child: const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Where you receive these notifications",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: const Icon(
                      Icons.notification_add,
                      color: Colors.black,
                    )
                  ),
                  const SizedBox(height: 4.0),
                  const Expanded(
                    child: Text(
                      "Push",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Switch(
                      value: state,
                      onChanged: (bool value)  async {
                        setState(() {
                          state = value;
                          setRequest(widget.type, boolToString(value));
                        });
                        final setStatus = await _settingRepository.setPushNotification(requestSetNotification);
                      }
                  )
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.95,
              child: const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
            ),
          ],
        ),
      ),
    ) ;
  }
}

class Example extends StatelessWidget{

  final String example;

  Example({required this.example});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: BTNBG,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: Image.asset(
                    'assets/images/messi-world-cup.png',
                    width: 40.0,
                    height: 40.0,
                  )
                ),
                const SizedBox(height: 4.0),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        text: "Messi",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0),
                        children: [
                          TextSpan(
                              text:
                              example,
                              style: const TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.normal))
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
