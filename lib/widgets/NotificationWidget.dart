import 'package:anti_fb/models/user_notification.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final UserNotification notification;

  const NotificationWidget({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: CircleAvatar(
              backgroundImage: AssetImage(notification.imageUrl),
              radius: MediaQuery.of(context).size.width * 0.09,
            ),
          ),
          // const SizedBox(width: 15.0),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(notification.content,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                        style: const TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold)),
                  ),
                  Text(notification.time,
                      style:
                      const TextStyle(fontSize: 12.0, color: Colors.grey)),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    onPressed: (){
                      optionBottomSheet(context);
                      },
                    icon: const Icon(
                        Icons.more_horiz,)),
                const Text(''),
              ],
            ),
          )
        ],
      ),
    );
  }

  void optionBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return Wrap(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 30.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(notification.imageUrl),
                      radius: 35.0,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(notification.content,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 13.0)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                          iconColor: Colors.black,
                          textStyle: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                          maximumSize: Size(MediaQuery.of(context).size.width, 50.0),
                          minimumSize: Size(MediaQuery.of(context).size.width, 50.0),
                          alignment: Alignment.centerLeft,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)
                          )
                        ),
                        onPressed: (){},
                        icon: const Icon(Icons.close),
                        label: const Text(
                            "Remove this notification",
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
