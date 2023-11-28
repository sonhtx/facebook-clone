import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/icon/IconSearchWidget.dart';
import '../../../widgets/icon/IconSettingWidget.dart';

// show people can be friend

class PeoplePage extends StatelessWidget{
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            title: PeopleAppBarTitle(),
            actions:  [
              Row(
                children: [
                  IconSettingWidget(),
                  Padding(
                      padding: EdgeInsets.only(right: 5), //
                      child: IconSearchWidget()
                  ),
                ],
              ),
            ],
            backgroundColor: Colors.white,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate( [




              ]
              )
          ),
        ]
    );
  }

}

class PeopleAppBarTitle extends StatelessWidget {
  const PeopleAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: const Text( 'Peoples', style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
          )
        ]
    );
  }
}