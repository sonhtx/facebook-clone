import 'dart:ui';
import 'package:anti_fb/models/request/ReqListBlocked.dart';
import 'package:anti_fb/repository/block/block_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:anti_fb/constants.dart';

import '../../../../models/block/UserBlocked.dart';

class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key});

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  late List<UserBlocked> _userBlocked =[];

  late List<Widget> listUserBlockedWidget = [];

  final BlockRepo _blockRepo = BlockRepo();

  static final RequestListBlock requestListBlock = RequestListBlock("1", "10");

  Future<void> getListBlock() async{
    await Future.delayed(const Duration(seconds: 2));

    try{
      List<UserBlocked>? listBlocked = await _blockRepo.getListBlocked(requestListBlock);

      setState(() {
        if(listBlocked != null){
          _userBlocked = listBlocked;
          for(int i=0;i<listBlocked.length;i++){

            listUserBlockedWidget.add(BlockedPeople(
                imageUrl: _userBlocked[i].avatar,
                userName: _userBlocked[i].name
            ));
          }
        }
      });
    }
    catch(error){
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getListBlock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BG,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Blocking"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 4.0),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Blocked People",
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Once you block someone, that person can no longer see things you post on your Timeline, tag you, invite you to events or groups, start a conversation with you, or add you as a friend. This doesn't include apps, games or groups you both participate in.",
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
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
                                  child: const Icon(
                                    Icons.add_box_rounded,
                                    color: FBBLUE,
                                    size: 40.0,
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    "ADD TO BLOCKED LIST",
                                    style: TextStyle(
                                        fontSize: 13.0, color: FBBLUE),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: listUserBlockedWidget
                          ),
                        ),
                      ),
                    )
                    )],
                ),
              ),
            )
          ],
        ));
  }
}

class BlockedPeople extends StatelessWidget {
  final String imageUrl;
  final String userName;

  const BlockedPeople(
      {super.key, required this.imageUrl, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
        child: TextButton(
          onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                    insetPadding: const EdgeInsets.all(16.0),
                    surfaceTintColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0.0), // Set the radius here
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Unblock $userName ?",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "If you unblock $userName they may be able to see your Timeline or contact you, depending on your settings",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                  color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Tags you and $userName previously added to each other may be restored",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                  color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "You'll have to wait 48 hours if you want to block $userName again",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0,
                                  color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.black),
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    shape: const BeveledRectangleBorder(
                                        borderRadius: BorderRadius.zero),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "UNBLOCK",
                                    style: TextStyle(
                                        fontSize: 15.0, color: FBBLUE),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
          style: TextButton.styleFrom(
            shape:
                const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                      child: (imageUrl == "") ?
                      Image.asset(
                        'assets/images/messi-world-cup.png',
                        width: 30.0,
                        height: 30.0,
                      ):
                        Image.network(
                            imageUrl,
                          width: 30.0,
                          height: 30.0,
                        )
                      ,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Expanded(
                    child: Text(
                      userName,
                      style: const TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Text(
                    "UNBLOCK",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
