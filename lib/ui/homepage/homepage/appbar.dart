

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/TextWidget.dart';

class HomeAppBarTitle extends StatefulWidget {
  const HomeAppBarTitle(this.coin, {super.key});

  final String coin;

  @override
  State<HomeAppBarTitle> createState() => HomeAppBarTitleState();

}
class HomeAppBarTitleState extends State<HomeAppBarTitle>{
  late String coin ;

  @override
  void initState() {
    super.initState();
    // String? coinValue = getCoin() as String?;
    // coin = coinValue!;
    coin = widget.coin;
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
              child: Container(
                // padding: const EdgeInsets.only(left: 100),
                width: 100,
                decoration: BoxDecoration(
                  color : GREY,
                  border: Border.all( color: TRANSPARENT,),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextWidget(text: "Coin : $coin", fontSize: 16, textColor: YELLOW,paddingLeft: 5,)
              )
          ),
        ]
    );
  }
}