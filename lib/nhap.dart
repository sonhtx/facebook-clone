import 'package:flutter/material.dart';

class Nhap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Friend Profile'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
              PopupMenuButton<String>(
                child: new ListTile(
                  title: new Text('Doge or lion?'),
                  trailing: const Icon(Icons.more_vert),
                ),
                onSelected: (value) {
                  // Handle the selected option
                  print('Selected: $value');
                },
                itemBuilder: (BuildContext context) {
                  return ['Option 1', 'Option 2', 'Option 3']
                      .map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
