
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../widgets/IconWidget.dart';

class PersonalPage extends StatelessWidget{
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: PersonalAppBarTitle(),
            actions:  [
              Row(
                children: [
                  IconWidget(icon: Icons.settings, onPressed: () { },),
                  Padding( padding: const EdgeInsets.only(right: 5), child: IconWidget(
                    icon: Icons.search,
                    onPressed: (){

                    },
                  )
                  ),
                ],
              ),
            ],
            backgroundColor: WHITE,
            floating: true,
          ),
          SliverList( delegate: SliverChildListDelegate( [


            ])
          ),
        ]
    );
  }

}
class PersonalAppBarTitle extends StatelessWidget {
  const PersonalAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          // IconButton(
          //   icon: const Icon(Icons.arrow_back, color: BLACK),
          //   onPressed: () {
          //     final HomeState? homeState = context.findAncestorStateOfType<HomeState>();
          //     homeState?.backFromPersonal();
          //   },
          // ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: const Text( 'Email', style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
          // change to email login
          )
        ]
    );
  }
}

