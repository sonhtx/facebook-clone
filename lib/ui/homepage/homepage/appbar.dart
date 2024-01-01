

import 'package:anti_fb/storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/TextWidget.dart';
import 'CoinManage.dart';
import 'createpost/createpost_screen.dart';

class HomeAppBarTitle extends StatefulWidget {
  const HomeAppBarTitle(this.coin, {super.key});

  final String coin;

  @override
  State<HomeAppBarTitle> createState() => HomeAppBarTitleState();

}
class HomeAppBarTitleState extends State<HomeAppBarTitle>{
  String coin = "0" ;

  @override
  void initState() {
    super.initState();
    // String? coinValue = getCoin() as String?;
    // coin = coinValue!;
    // getCoin().then((value) => setState(() => coin = value!));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Text(
            'facebook',
            style: TextStyle(color: FBBLUE, fontSize: 24.0, fontWeight: FontWeight.bold, letterSpacing: -1.2,),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10), //
                child : GestureDetector(
                  onTap: (){
                    Navigator.of(context, rootNavigator: true)
                        .push(CupertinoPageRoute(
                        builder: (context) => const CoinManage()));
                  },
                  child: Container(
                    width: 85,
                    decoration: BoxDecoration(
                      color : GREY,
                      border: Border.all( color: TRANSPARENT,),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextWidget(text: "Your Coin", fontSize: 16, textColor: YELLOW,paddingLeft: 5,)
                  // padding: const EdgeInsets.only(left: 100),
                                  ),
                )
          ),
        ]
    );
  }
}