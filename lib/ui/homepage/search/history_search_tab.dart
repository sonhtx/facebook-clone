import 'package:flutter/material.dart';

class HistorySearchTab extends StatefulWidget {
  const HistorySearchTab({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HistorySearchTabState();
  }
}

class _HistorySearchTabState extends State<HistorySearchTab> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
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
                    onPressed: () => {Navigator.of(context).pop()},
                  ),
                  const Text('History',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(height: 30.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Clear all',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                ],
              ),
              const Text(
                'December 2, 2023',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 70, 126, 199),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You searched on facebook',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\'Nguyen Van A\'',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(197, 14, 13, 13)),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.lock,
                              size: 12,
                            ),
                            Text(
                              'Only you',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(197, 14, 13, 13)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Hidden on your profile',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color.fromARGB(197, 14, 13, 13)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () => {},
                        icon: const Icon(
                          Icons.clear,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
