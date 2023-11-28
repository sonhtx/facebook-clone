

import 'package:anti_fb/ui/homepage/menupage/menu_option.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/icon/IconSearchWidget.dart';
import '../../../widgets/icon/IconSettingWidget.dart';

class MenuPage extends StatelessWidget{
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: MenuAppBarTitle(),
            actions:  [
              Row(
                children: [
                  IconSettingWidget(),
                  Padding( padding: EdgeInsets.only(right: 5), child: IconSearchWidget()
                  ),
                ],
              ),
            ],
            backgroundColor: WHITE,
            floating: true,
          ),
          SliverList( delegate: SliverChildListDelegate( [
            const MenuOption(),
          ])
          ),
        ]
    );
  }
  
}
class MenuAppBarTitle extends StatelessWidget {
  const MenuAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 5),
          child: const Text( 'Menu', style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
        )
      ]
    );
  }
}

