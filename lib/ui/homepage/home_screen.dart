import 'package:anti_fb/constants/constants.dart';
import 'package:anti_fb/data/data.dart';
import 'package:anti_fb/widgets/circle_button.dart';
import 'package:anti_fb/widgets/create_post_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/post_model.dart';
import '../../widgets/post_container.dart';

class HomeScreen extends StatefulWidget {

  final ScrollController scrollController;
  const HomeScreen({super.key, required this.scrollController});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: widget.scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor : Colors.white,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              title: const Text(
                'facebook',
                style: TextStyle(
                  color: Constants.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              centerTitle: false,
              floating: true,
              actions: [
                CircleButton(icon: Icons.add, iconSize: 30.0, onPressed: () {}),
                CircleButton(
                    icon: Icons.search, iconSize: 30.0, onPressed: () {}),
                CircleButton(
                    icon: MdiIcons.facebookMessenger,
                    iconSize: 30.0,
                    onPressed: () {})
              ],
            ),
            const SliverToBoxAdapter(
              child: CreatePostContainer(currentUser: currentUser),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 5.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
