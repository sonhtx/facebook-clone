import 'package:anti_fb/constants.dart';
import 'package:flutter/material.dart';

class PushDetail extends StatefulWidget {
  const PushDetail({super.key});

  @override
  State<PushDetail> createState() => _PushDetailState();
}

class _PushDetailState extends State<PushDetail> {
  bool light = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Push"),
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
                      value: light,
                      onChanged: (bool value){
                        setState(() {
                          light = value;
                        });
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
                      value: light,
                      onChanged: (bool value){
                        setState(() {
                          light = value;
                        });
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
                          "Phong LED",
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
                      value: light,
                      onChanged: (bool value){
                        setState(() {
                          light = value;
                        });
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
                      value: light,
                      onChanged: (bool value){
                        setState(() {
                          light = value;
                        });
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

