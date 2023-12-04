
import 'package:anti_fb/widgets/icon/IconMessageWidget.dart';
import 'package:anti_fb/widgets/icon/IconSearchWidget.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/post/PostListData.dart';
import 'appbar.dart';
import 'createpostbar.dart';
import 'listpost.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key, required this.coin, required this.email, required this.postlists, required this.scrollController});

  final String coin ;
  final String email;
  final List<PostListData> postlists;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
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
                    IconSearchWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, '/search');
                      },
                    ),
                    IconMessageWidget(
                      onPressed: () {


                      },
                    )

                  ],)
            ),
          ],
        ),

        const SliverToBoxAdapter( child: CreatePostButton()),

        SliverList( delegate: SliverChildListDelegate( [ListPostWidget(postlists: postlists,)])),

        ]
    );
  }
}








