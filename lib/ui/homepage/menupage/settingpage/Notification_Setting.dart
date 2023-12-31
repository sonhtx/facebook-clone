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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                        color: Colors.white,
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Facebook may still send you important notifications about your account and content outside of your preferred notification settings",
                            style: TextStyle(fontSize: 15.0, color: Colors.black),
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold
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
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailNotification(type: 1,light: state(pushSettingsData.like_comment),)),
                          );
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
                                    child: Icon(Icons.comment_rounded,color: Colors.black,)),
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
                                          fontSize: 17.0, color: Colors.black),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.like_comment),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailNotification(type: 2,light: state(pushSettingsData.like_comment),),
                          ));
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
                                    child: Icon(Icons.people,color: Colors.black,)),
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
                                          fontSize: 17.0, color: Colors.black),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.from_friends),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailNotification(type: 3,light: state(pushSettingsData.like_comment),),
                          ));
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
                                    child: Icon(Icons.person_add_alt_outlined,color: Colors.black,)),
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
                                          fontSize: 17.0, color: Colors.black),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.requested_friend),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>DetailNotification(type: 4,light: state(pushSettingsData.like_comment),),
                          ));
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
                                    child: Icon(Icons.person_add_alt_outlined,color: Colors.black,)),
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
                                          fontSize: 17.0, color: Colors.black),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.suggested_friend),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailNotification(type: 5,light: state(pushSettingsData.like_comment),),
                          ));
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
                                    child: Icon(Icons.cake,color: Colors.black,)),
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
                                          fontSize: 17.0, color: Colors.black),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.birthday),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailNotification(type: 6,light: state(pushSettingsData.like_comment),),
                          ));
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
                                    child: Icon(Icons.play_circle_outlined,color: Colors.black,)),
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
                                          fontSize: 17.0, color: Colors.black),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.video),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => DetailNotification(type: 7,light: state(pushSettingsData.report),)),
                          );
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
                                    child: Icon(Icons.report,color: Colors.black,)),
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
                                          fontSize: 17.0, color: Colors.black),
                                    ),
                                    Text(
                                      typeOfNotification(pushSettingsData.report),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const PushDetail()),
                          );
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
                                    child: Icon(Icons.notifications_on_outlined,color: Colors.black,)),
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
                                          fontSize: 17.0, color: Colors.black),
                                    ),
                                    Text(
                                      typeOfPush(pushSettingsData.notification_on),
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
