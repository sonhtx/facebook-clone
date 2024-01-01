import 'package:anti_fb/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../models/request/ReqSetNotification.dart';
import '../../../../../repository/setting/setting_repo.dart';

class PushDetail extends StatefulWidget {
  final RequestSetNotification requestSetNotification;
  final bool notification_on;
  final bool vibrate_on;
  final bool sound_on;
  final bool led_on;
  const PushDetail({super.key, required this.notification_on, required this.vibrate_on, required this.sound_on, required this.led_on, required this.requestSetNotification});

  @override
  State<PushDetail> createState() => _PushDetailState();
}

class _PushDetailState extends State<PushDetail> {
  late bool _notification_on;
  late bool _vibrate_on;
  late bool _sound_on;
  late bool _led_on;
  late RequestSetNotification requestSetNotification;
  final SettingRepository _settingRepository = SettingRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _notification_on = widget.notification_on;
    _vibrate_on = widget.vibrate_on;
    _sound_on = widget.sound_on;
    _led_on = widget.led_on;
    requestSetNotification = widget.requestSetNotification;
  }
  String boolToString(bool state){
    if(state == true){
      return "1";
    }else{
      return "0";
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Push"),
          leading: BackButton(
            onPressed: (){
              Navigator.pop(context, true);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 4.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: BTNBG,
                          child: Icon(Icons.notifications_off,color: Colors.black,)),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mute Push Notifications",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.black),
                          ),
                          Text(
                            "Off",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 10.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                        value: !_notification_on,
                        onChanged: (bool value) async {
                          setState(() {
                            _notification_on = !value;
                          });
                          requestSetNotification  = RequestSetNotification(
                              requestSetNotification.like_comment,
                              requestSetNotification.from_friends,
                              requestSetNotification.requested_friend,
                              requestSetNotification.suggested_friend,
                              requestSetNotification.birthday,
                              requestSetNotification.video,
                              requestSetNotification.report,
                              requestSetNotification.sound_on,
                              boolToString(_notification_on),
                              requestSetNotification.vibrant_on,
                              requestSetNotification.led_on
                          );
                          final setStatus = await _settingRepository.setPushNotification(requestSetNotification);
                        }
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: BTNBG,
                          child: Icon(Icons.vibration,color: Colors.black,)),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vibrate",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.black),
                          ),
                          Text(
                            "Vibrate on incoming notifications",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 10.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                        value: _vibrate_on,
                        onChanged: (bool value) async {
                          setState(() {
                            _vibrate_on = value;
                          });
                          requestSetNotification  = RequestSetNotification(
                              requestSetNotification.like_comment,
                              requestSetNotification.from_friends,
                              requestSetNotification.requested_friend,
                              requestSetNotification.suggested_friend,
                              requestSetNotification.birthday,
                              requestSetNotification.video,
                              requestSetNotification.report,
                              requestSetNotification.sound_on,
                              requestSetNotification.notification_on,
                              boolToString(_vibrate_on),
                              requestSetNotification.led_on
                          );
                          final setStatus = await _settingRepository.setPushNotification(requestSetNotification);
                        }
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: BTNBG,
                          child: Icon(Icons.flash_on,color: Colors.black,)),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone LED",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.black),
                          ),
                          Text(
                            "Flash LED on incoming notifications",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 10.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                        value: _led_on,
                        onChanged: (bool value) async {
                          setState(() {
                            _led_on = value;
                          });
                          requestSetNotification  = RequestSetNotification(
                              requestSetNotification.like_comment,
                              requestSetNotification.from_friends,
                              requestSetNotification.requested_friend,
                              requestSetNotification.suggested_friend,
                              requestSetNotification.birthday,
                              requestSetNotification.video,
                              requestSetNotification.report,
                              requestSetNotification.sound_on,
                              requestSetNotification.notification_on,
                              requestSetNotification.vibrant_on,
                              boolToString(_led_on)
                          );
                          final setStatus = await _settingRepository.setPushNotification(requestSetNotification);
                        }
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                      child: const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: BTNBG,
                          child: Icon(Icons.speaker_phone,color: Colors.black,)),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sounds",
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.black),
                          ),
                          Text(
                            "Play sounds on incoming notifications",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 10.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                        value: _sound_on,
                        onChanged: (bool value) async {
                          setState(() {
                            _sound_on = value;
                          });
                          requestSetNotification  = RequestSetNotification(
                              requestSetNotification.like_comment,
                              requestSetNotification.from_friends,
                              requestSetNotification.requested_friend,
                              requestSetNotification.suggested_friend,
                              requestSetNotification.birthday,
                              requestSetNotification.video,
                              requestSetNotification.report,
                              boolToString(_sound_on),
                              requestSetNotification.notification_on,
                              requestSetNotification.vibrant_on,
                              requestSetNotification.led_on
                          );
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
      ),
    ) ;
  }
}

