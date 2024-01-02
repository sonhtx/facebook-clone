import 'package:anti_fb/models/SearchUser.dart';
import 'package:anti_fb/models/request/ReqSearchUser.dart';
import 'package:anti_fb/repository/search/search_repo.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../repository/block/block_repo.dart';

class SearchUserTab extends StatefulWidget {
  SearchUserTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchUserTabState();
  }
}


class _SearchUserTabState extends State<SearchUserTab> {
  final controller = TextEditingController();
  List<SearchPeople> userSearchWidgetList = [];
  final SearchRepository _searchRepository = SearchRepository();
  final BlockRepo blockRepo = BlockRepo();
  @override
  void initState() {
    super.initState();
    controller.addListener(_printLatestValue);
  }

  bool flag = false;

  Future<void> getUserSearch(String keyword) async {
    ReqSearchUser reqSearchUser = ReqSearchUser(keyword, "0", "10");
    try {
      List<SearchUser> listUser = await _searchRepository.getSearchUserResult(reqSearchUser);
      setState(() {
        userSearchWidgetList = [];
        if(listUser != null){
          for(int i=0;i<listUser.length;i++){
            userSearchWidgetList.add(SearchPeople(
                imageUrl: listUser[i].avatar,
                userName: listUser[i].username,
                id: listUser[i].id,
                blockRepo: blockRepo,
                notifyParent: (){
                  setState(() {
                    blockRepo.setBlock(listUser[i].id);
                    getUserSearch(keyword);
                    Navigator.pop(context);
                    flag = true;
                  });
                }));
          }
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _printLatestValue() {
    final text = controller.text;
    setState(() {
      getUserSearch(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, flag);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // ),
          body: Container(
            // Center is a layout  It takes a single child and positions it
            // in the middle of the parent.
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: ()  {Navigator.pop(context, flag);},
                    ),
                    Container(
                      width: 300,
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        // vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Search Facebook',
                          border: InputBorder.none,
                        ),
                        onChanged: (text){

                      },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Scrollbar(
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: userSearchWidgetList
                          ),
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class SearchPeople extends StatefulWidget {
  final String id;
  final String imageUrl;
  final String userName;
  final VoidCallback notifyParent;
  final BlockRepo blockRepo;

  const SearchPeople(
      {super.key, required this.imageUrl, required this.userName, required this.id, required this.blockRepo, required this.notifyParent});

  @override
  State<SearchPeople> createState() => _SearchPeopleState();
}

class _SearchPeopleState extends State<SearchPeople> {
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
                          "Block ${widget.userName} ?",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "${widget.userName} will no longer be able to:",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                              color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "• See your posts",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                              color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "• Tag you",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                              color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "• Invite you to events or groups",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                              color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "• Message you",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                              color: Colors.grey),
                        ),
                      ),const SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "If you're friend, block ${widget.userName} will also unfriend you.",
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
                              onPressed: (){
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
                              onPressed: widget.notifyParent,
                              child: const Text(
                                "BLOCK",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.red),
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
                    child: (widget.imageUrl == "")?
                        Image.asset(defaultAvatar,
                          width: 30.0,
                          height: 30.0,):
                    Image.network(
                      widget.imageUrl,
                      width: 30.0,
                      height: 30.0,
                    )
                  ),
                  const SizedBox(height: 4.0),
                  Expanded(
                    child: Text(
                      widget.userName,
                      style: const TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  const Text(
                    "BLOCK",
                    style: TextStyle(color: Colors.red),
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

