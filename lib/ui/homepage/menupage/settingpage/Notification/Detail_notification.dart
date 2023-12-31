import 'package:anti_fb/constants.dart';
import 'package:flutter/material.dart';

class DetailNotification extends StatefulWidget {
  final int type;
  final bool light;
  const DetailNotification({super.key, required this.type, required this.light});

  @override
  State<DetailNotification> createState() => _DetailNotificationState();
}

class _DetailNotificationState extends State<DetailNotification> {
  late String description;
  late String example;
  late bool light;
  void content(int type){
    switch(type){
      case 1:
        setState(() {
          description = "These are notifications for comments and likes on your postand replies to your commnet. Here's an example";
          example = " replied to a comment that you're tagged in";
        });
    }
  }

  @override
  void initState() {
    super.initState();
    light = widget.light;
    content(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Notification Settings"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      description,
                      style: const TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  )),
            ),
            Example(example: example),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.95,
              child: const Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Where you receive these notifications",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: const Icon(
                      Icons.notification_add,
                      color: Colors.black,
                    )
                  ),
                  const SizedBox(height: 4.0),
                  const Expanded(
                    child: Text(
                      "Push",
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
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

class Example extends StatelessWidget{

  final String example;

  Example({required this.example});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 8.0, 5.0, 8.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: BTNBG,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                  child: Image.asset(
                    'assets/images/messi-world-cup.png',
                    width: 40.0,
                    height: 40.0,
                  )
                ),
                const SizedBox(height: 4.0),
                const Expanded(
                  child: Text(
                    "Messi",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
