import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../constants.dart';
import '../../../models/post/PostListData.dart';
import '../../../models/request/ReqListPost_VideoData.dart';
import '../../../repository/post/post_repo.dart';
import '../../../widgets/IconWidget.dart';
import '../search/search_tab.dart';
import 'appbar.dart';
import 'createpostbar.dart';
import 'PostWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
        required this.coin,
        required this.email,
        required this.scrollController});

  final String coin;
  final String email;

  final ScrollController scrollController;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;
  static const _pageSize = 8;

  final PostRepository _postRepository = PostRepository();

  final PagingController<int, PostListData> _pagingController =
  PagingController(firstPageKey: 1);

  late RequestListPost_VideoData requestListPostData =
  RequestListPost_VideoData(null, "1", "1", "1.0", "1.0", null, "0", "10");
  Future<void> _fetchPage(pageKey) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<PostListData>? listPost =
      await _postRepository.getlistpost(requestListPostData);
      setState(() {
        index+=10;
        requestListPostData = RequestListPost_VideoData(null, "1", "1", "1.0", "1.0",
            null, index.toString(), "10");
      });
      if(listPost!=null){
        final isLastPage = listPost.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(listPost);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(listPost, nextPageKey);
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    _pagingController.addStatusListener((status) {
      if (status == PagingStatus.subsequentPageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Something went wrong while fetching a new page.',
            ),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () => _pagingController.retryLastFailedRequest(),
            ),
          ),
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () {
          setState(() {
            index = 0;
            requestListPostData = RequestListPost_VideoData(null, "1", "1", "1.0", "1.0",
                null, index.toString(), "10");
          });
            return Future.sync(
              ()=>_pagingController.refresh(),
            );
          } ,
        child : CustomScrollView(controller: widget.scrollController, slivers: <Widget>[
            SliverAppBar(
              title: HomeAppBarTitle(widget.coin),
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
                        IconWidget( icon: Icons.message, onPressed: () {},)
                      ],
                    )),
              ],
            ),
            const SliverToBoxAdapter(child: CreatePostButton()),

            PagedSliverList<int, PostListData>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<PostListData>(
                  animateTransitions: true,
                  itemBuilder: (context, item, index) => PostWidget(
                    item.id,
                    item.name,
                    item.image,
                    item.described,
                    item.created.substring(0, 10),
                    item.feel,
                    item.comment_mark,
                    item.is_felt,
                    item.author.name,
                    item.author.avatar,
                    false
                  )
              ),
            ),
          ]),
        )
      ),
    );
  }
}