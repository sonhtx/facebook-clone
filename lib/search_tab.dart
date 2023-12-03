import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => {},
                  ),
                  Container(
                    width: 300,
                    height: 50,
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
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                  Text('See all',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.normal)),
                ],
              ),
              const Divider(height: 30.0),
              Row(
                children: <Widget>[
                  // CircleAvatar(
                  //   backgroundImage: AssetImage('./images/fb_icon.jpg'),
                  //   radius: 40.0,
                  // ),
                  Icon(
                    Icons.search_rounded,
                    size: 22.0, // Kích thước của biểu tượng
                    color: Colors.black, // Màu của biểu tượng
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Nguyen Van A',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('./images/fb_icon.jpg'),
                    radius: 10.0,
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Nguyen Van A',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
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
