import 'package:anti_fb/ui/settingpage/Change_username.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../constants/constants.dart';

class PersonalDetail extends StatelessWidget {
  const PersonalDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bg,
      appBar: AppBar(
        backgroundColor: Colors.white ,
      ),
      body: Column(
        children: [
          const SizedBox(height: 4.0),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Personal Detail",
                            style: TextStyle(
                                fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4.0),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "General  ",
                            style: TextStyle(
                                fontSize: 17.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                      child: TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) => const ChangeUsername()),
                            );
                          },
                          style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                          ),
                          child:SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.85,
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        ),
                                      ),
                                      Text(
                                        "Viet Dung",
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: Colors.grey
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined
                                )
                              ],
                            ),
                          )
                      ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

