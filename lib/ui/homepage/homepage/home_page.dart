import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../widgets/IconWidget.dart';
import '../search/search_tab.dart';
import 'appbar.dart';
import 'createpostbar.dart';
import 'listpost.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key,
      required this.coin,
      required this.email,
      required this.scrollController});

  final String coin;
  final String email;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(controller: scrollController, slivers: <Widget>[
          SliverAppBar(
            title: HomeAppBarTitle(coin),
            centerTitle: false,
            backgroundColor: WHITE,
            floating: true,
            actions: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      IconWidget(
                        icon: Icons.search,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchTab()));
                        },
                      ),
                      IconWidget(
                        icon: Icons.message,
                        onPressed: () {},
                      )
                    ],
                  )),
            ],
          ),
          const SliverToBoxAdapter(child: CreatePostButton()),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListPostWidget( id: null,),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
