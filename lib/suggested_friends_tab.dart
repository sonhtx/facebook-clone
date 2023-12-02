import 'package:flutter/material.dart';

class SuggestedFriendsTab extends StatefulWidget {
  const SuggestedFriendsTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SuggestedFriendsTabState();
  }
}

class _SuggestedFriendsTabState extends State<SuggestedFriendsTab> {
  @override
  Widget build(BuildContext context) {
    void _onSearch() {
      print("hello world");
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: _onSearch,
                  ),
                  const Text('Suggestions',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.normal)),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _onSearch,
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              const Text('People you may know',
                  style:
                      TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('./images/fb_icon.jpg'),
                    radius: 40.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Chris',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text('Add friend',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.0)),
                          ),
                          SizedBox(width: 10.0),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text('Remove',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('./images/fb_icon.jpg'),
                    radius: 40.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Chris',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100.0, vertical: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text('Cancel',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
