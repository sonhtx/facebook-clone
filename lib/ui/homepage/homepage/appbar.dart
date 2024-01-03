
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/TextWidget.dart';
import 'CoinManage.dart';

class HomeAppBarTitle extends StatefulWidget {
  const HomeAppBarTitle(this.coin, {super.key});

  final String coin;

  @override
  State<HomeAppBarTitle> createState() => HomeAppBarTitleState();
}

class HomeAppBarTitleState extends State<HomeAppBarTitle> {
  String coin = "0";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text(
        'facebook',
        style: TextStyle(
          color: FBBLUE,
          fontSize: 24.0,
          fontWeight: FONTBOLD,
          letterSpacing: -1.2,
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(left: 10), //
          child: GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                  CupertinoPageRoute(builder: (context) => const CoinManage()));
            },
            child: Container(
                width: 85,
                decoration: BoxDecoration(
                  color: GREY,
                  border: Border.all(
                    color: TRANSPARENT,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const TextWidget(
                  text: "Your Coin",
                  fontSize: 16,
                  textColor: YELLOW,
                  paddingLeft: 5,
                )
                // padding: const EdgeInsets.only(left: 100),
                ),
          )),
    ]);
  }
}