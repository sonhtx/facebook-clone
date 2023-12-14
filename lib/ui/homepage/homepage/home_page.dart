import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/post/PostListData.dart';
import '../../../widgets/IconWidget.dart';
import 'appbar.dart';
import 'createpostbar.dart';
import 'listpost.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  late String coin = '';
  late String email = '';
  late List<PostListData> postlist = [];
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        email: email,
        coin: coin,
        postlists: postlist,
        scrollController: scrollController,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key,
      required this.coin,
      required this.email,
      required this.postlists,
      required this.scrollController});

  final String coin;
  final String email;
  final List<PostListData> postlists;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: scrollController, slivers: <Widget>[
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
                      Navigator.pushNamed(context, '/search');
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
            ListPostWidget(
              postlists: postlists,
            ),
          ],
        ),
      ),
    ]);
  }
}
