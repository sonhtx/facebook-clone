import 'package:flutter/material.dart';

class YourFriendsTab extends StatefulWidget {
  const YourFriendsTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _YourFriendsTabState();
  }
}

class _YourFriendsTabState extends State<YourFriendsTab> {
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
                    icon: Icon(Icons.arrow_back),
                    onPressed: _onSearch,
                  ),
                  const Text('Your Friends',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.normal)),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _onSearch,
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('100 Friends',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                  Text('sort',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal)),
                ],
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Row(
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
                          Text(
                            'Chris',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '50 mutual friends',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: _onSearch,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
