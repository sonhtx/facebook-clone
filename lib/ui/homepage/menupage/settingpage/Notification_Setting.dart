import 'package:anti_fb/models/request/ReqSetNotification.dart';
import 'package:anti_fb/models/setting/PushSettingsData.dart';
import 'package:anti_fb/repository/setting/setting_repo.dart';
import 'package:anti_fb/ui/homepage/menupage/settingpage/Notification/Push_Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'Notification/Detail_notification.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {

  final SettingRepository _settingRepository = SettingRepository();
  late PushSettingsData pushSettingsData;
  late RequestSetNotification requestSetNotification;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async{
    try{
      PushSettingsData _pushSettingsData = await _settingRepository.getPushSettings();
      if(_pushSettingsData != null){
        pushSettingsData = _pushSettingsData;
        requestSetNotification = RequestSetNotification(
            pushSettingsData.like_comment,
            pushSettingsData.from_friends,
            pushSettingsData.requested_friend,
            pushSettingsData.suggested_friend,
            pushSettingsData.birthday,
            pushSettingsData.video,
            pushSettingsData.report,
            pushSettingsData.sound_on,
            pushSettingsData.notification_on,
            pushSettingsData.vibrant_on,
            pushSettingsData.led_on
        );
      }else{
      }
    }catch(e){
      return;
    }
  }
  String typeOfNotification(String id){
    if(id == "1"){
      return "Push only";
    }else{
      return "In-app only";
    }
  }

  String typeOfPush(String id){
    if(id == "1"){
      return "On";
    }else{
      return "Off";
    }
  }

  bool state(String id){
    if(id == "1"){
      return true;
    }
    else{
      return false;
    }
  }
  Future<void> _navigateAndDisplaySelection(BuildContext context,int type,bool state,RequestSetNotification requestSetNotification) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => DetailNotification(type: type, state: state, requestSetNotification: requestSetNotification,)),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if(result == true){
      setState(() {
        _fetchData();
      });
    }
  }

  Future<void> _navigateAndDisplaySelection2(BuildContext context,bool notification_on,bool vibrate_on,bool sound_on, bool led_on,RequestSetNotification requestSetNotification) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => PushDetail(notification_on: notification_on, vibrate_on: vibrate_on, sound_on: sound_on, led_on: led_on, requestSetNotification: requestSetNotification)),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if(result == true){
      setState(() {
        _fetchData();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        backgroundColor: WHITE,
        title: const Text("Notification Settings"),
      ),
      body: FutureBuilder(
        future: _fetchData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else{
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 4.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: WHITE,
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Facebook may still send you important notifications about your account and content outside of your preferred notification settings",
                            style: TextStyle(fontSize: 15.0, color: BLACK),
                          ),
                        )),
                  ),
                  const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "What Notifications You Receive",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: BLACK,
                            fontWeight: FONTBOLD
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () async {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //       builder: (context) => DetailNotification(type: 1,state: state(pushSettingsData.like_comment), requestSetNotification: requestSetNotification,)),
                          // );
                          _navigateAndDisplaySelection(context,1, state(pushSettingsData.like_comment),requestSetNotification);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: BTNBG,
                                    child: Icon(Icons.comment_rounded,color: BLACK,)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Comment",
                                      style: TextStyle(
                                          fontSize: 17.0, color: BLACK),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.like_comment),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: GREY),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //       builder: (context) => DetailNotification(type: 2,state: state(pushSettingsData.from_friends), requestSetNotification: requestSetNotification),
                          // ));
                          _navigateAndDisplaySelection(context,2, state(pushSettingsData.from_friends),requestSetNotification);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: BTNBG,
                                    child: Icon(Icons.people,color: BLACK,)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Updates from friend",
                                      style: TextStyle(
                                          fontSize: 17.0, color: BLACK),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.from_friends),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: GREY),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //       builder: (context) => DetailNotification(type: 3,state: state(pushSettingsData.requested_friend), requestSetNotification: requestSetNotification),
                          // ));
                          _navigateAndDisplaySelection(context,3, state(pushSettingsData.requested_friend),requestSetNotification);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: BTNBG,
                                    child: Icon(Icons.person_add_alt_outlined,color: BLACK,)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Friend Requests",
                                      style: TextStyle(
                                          fontSize: 17.0, color: BLACK),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.requested_friend),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: GREY),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //       builder: (context) =>DetailNotification(type: 4,state: state(pushSettingsData.suggested_friend), requestSetNotification: requestSetNotification),
                          // ));
                          _navigateAndDisplaySelection(context,4, state(pushSettingsData.suggested_friend),requestSetNotification);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: BTNBG,
                                    child: Icon(Icons.person_add_alt_outlined,color: BLACK,)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Suggested Friend",
                                      style: TextStyle(
                                          fontSize: 17.0, color: BLACK),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.suggested_friend),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: GREY),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //       builder: (context) => DetailNotification(type: 5,state: state(pushSettingsData.birthday), requestSetNotification: requestSetNotification),
                          // ));
                          _navigateAndDisplaySelection(context,5, state(pushSettingsData.birthday),requestSetNotification);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: BTNBG,
                                    child: Icon(Icons.cake,color: BLACK,)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Birthdays",
                                      style: TextStyle(
                                          fontSize: 17.0, color: BLACK),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.birthday),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: GREY),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //       builder: (context) => DetailNotification(type: 6,state: state(pushSettingsData.video), requestSetNotification: requestSetNotification),
                          // ));
                          _navigateAndDisplaySelection(context,6, state(pushSettingsData.video),requestSetNotification);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: BTNBG,
                                    child: Icon(Icons.play_circle_outlined,color: BLACK,)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Video",
                                      style: TextStyle(
                                          fontSize: 17.0, color: BLACK),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.video),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: GREY),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //       builder: (context) => DetailNotification(type: 7,state: state(pushSettingsData.report), requestSetNotification: requestSetNotification)),
                          // );
                          _navigateAndDisplaySelection(context,7, state(pushSettingsData.report),requestSetNotification);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: BTNBG,
                                    child: Icon(Icons.report,color: BLACK,)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Report",
                                      style: TextStyle(
                                          fontSize: 17.0, color: BLACK),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.report),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: GREY),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.95,
                    child: const Divider(
                      color: BLACK,
                      thickness: 0.5,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   CupertinoPageRoute(
                          //       builder: (context) => PushDetail(
                          //         notification_on: state(pushSettingsData.notification_on),
                          //         vibrate_on: state(pushSettingsData.vibrant_on),
                          //         sound_on: state(pushSettingsData.sound_on),
                          //         led_on: state(pushSettingsData.led_on),
                          //         requestSetNotification: requestSetNotification,
                          //       )),
                          // );
                          _navigateAndDisplaySelection2(context,state(pushSettingsData.notification_on),state(pushSettingsData.vibrant_on),state(pushSettingsData.sound_on),state(pushSettingsData.led_on),requestSetNotification);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child: const CircleAvatar(
                                    radius: 20.0,
                                    backgroundColor: BTNBG,
                                    child: Icon(Icons.notifications_on_outlined,color: BLACK,)),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Push",
                                      style: TextStyle(
                                          fontSize: 17.0, color: BLACK),
                                    ),
                                    Text(
                                      typeOfPush(pushSettingsData.notification_on),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: GREY),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
