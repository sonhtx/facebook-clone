import 'dart:ui';
import 'package:anti_fb/models/request/ReqListBlocked.dart';
import 'package:anti_fb/repository/block/block_repo.dart';
import 'package:anti_fb/ui/homepage/menupage/settingpage/search_people/search_people.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  static final RequestListBlock requestListBlock = RequestListBlock("0", "20");

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => SearchUserTab()),
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return;

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    if(result == true){
      print("1234");
      setState(() {
        getListBlock();
      });
    }
  }

  Future<void> getListBlock() async{
    await Future.delayed(const Duration(seconds: 2));

    try{
      List<UserBlocked>? listBlocked = await _blockRepo.getListBlocked(requestListBlock);

      setState(() {
        listUserBlockedWidget = [];
        if(listBlocked != null){
          _userBlocked = listBlocked;
          for(int i=0;i<listBlocked.length;i++){

            listUserBlockedWidget.add(BlockedPeople(
                id: _userBlocked[i].id,
                imageUrl: _userBlocked[i].avatar,
                userName: _userBlocked[i].name,
                blockRepo:_blockRepo,
                notifyParent: (){
                  setState(() {
                    _blockRepo.unBlock(_userBlocked[i].id);
                    getListBlock();
                    Navigator.pop(context);
                  });
                },
            ));
            print("listUserBlockedWidget.length: ${listUserBlockedWidget.length}");
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
    super.initState();
    getListBlock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BG,
        appBar: AppBar(
          backgroundColor: WHITE,
          title: const Text("Blocking"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 4.0),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: WHITE,
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
                                    fontSize: 13.0, color: GREY),
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
                          onPressed: () async{
                            _navigateAndDisplaySelection(context);
                          },
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
                          color: WHITE,
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

class BlockedPeople extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String userName;
  final VoidCallback notifyParent;
  final BlockRepo blockRepo;

  const BlockedPeople(
      {super.key, required this.imageUrl, required this.userName, required this.id, required this.blockRepo, required this.notifyParent});

  @override
  State<BlockedPeople> createState() => _BlockedPeopleState();
}

class _BlockedPeopleState extends State<BlockedPeople> {
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
                    surfaceTintColor: WHITE,
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
                              "Unblock ${widget.userName} ?",
                              style: const TextStyle(
                                  fontWeight: FONTBOLD, fontSize: 25.0),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "If you unblock ${widget.userName} they may be able to see your Timeline or contact you, depending on your settings",
                              style: const TextStyle(
                                  fontWeight: FONTNORMAL,
                                  fontSize: 15.0,
                                  color: GREY),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Tags you and ${widget.userName} previously added to each other may be restored",
                              style: const TextStyle(
                                  fontWeight: FONTNORMAL,
                                  fontSize: 15.0,
                                  color: GREY),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "You'll have to wait 48 hours if you want to block ${widget.userName} again",
                              style: const TextStyle(
                                  fontWeight: FONTNORMAL,
                                  fontSize: 15.0,
                                  color: GREY),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    "CANCEL",
                                    style: TextStyle(
                                        fontSize: 15.0, color: BLACK),
                                  )),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    shape: const BeveledRectangleBorder(
                                        borderRadius: BorderRadius.zero),
                                  ),
                                  onPressed: widget.notifyParent,
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
                      child: (widget.imageUrl == "") ?
                      Image.asset(
                        defaultAvatar,
                        width: 30.0,
                        height: 30.0,
                      ):
                        Image.network(
                            widget.imageUrl,
                          width: 30.0,
                          height: 30.0,
                        )
                      ,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Expanded(
                    child: Text(
                      widget.userName,
                      style: const TextStyle(
                          fontSize: 17.0,
                          color: BLACK,
                          fontWeight: FONTNORMAL),
                    ),
                  ),
                  const Text(
                    "UNBLOCK",
                    style: TextStyle(color: GREY),
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
