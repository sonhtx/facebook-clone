
import 'package:anti_fb/ui/homepage/videopage/videoWidget.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../constants.dart';
import '../../../models/post/VideoData.dart';
import '../../../models/request/ReqListPost_VideoData.dart';
import '../../../repository/post/post_repo.dart';
import '../../../widgets/IconWidget.dart';
import '../homepage/appbar.dart';
import '../search/search_tab.dart';

class VideoPage extends StatefulWidget{

  final ScrollController scrollController;
  const VideoPage({super.key, required this.scrollController});


  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  int index = 0;
  static const _pageSize = 8;

  final PostRepository _postRepository = PostRepository();

  final PagingController<int, VideoData> _pagingController =
  PagingController(firstPageKey: 1);

  late RequestListPost_VideoData requestListPostData =
  RequestListPost_VideoData(null, "1", "1", "1.0", "1.0", null, "0", "10");
  Future<void> _fetchPage(pageKey) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<VideoData>? listVideo =
      await _postRepository.getlistvideo(requestListPostData);
      setState(() {
        index+=10;
        requestListPostData = RequestListPost_VideoData(null, "1", "1", "1.0", "1.0",
            null, index.toString(), "10");
      });
      if(listVideo!=null){
        final isLastPage = listVideo.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(listVideo);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(listVideo, nextPageKey);
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
                title: const VideoAppBarTitle(),
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
                                  MaterialPageRoute( builder: (context) => SearchTab()));
                            },
                          ),
                          IconWidget( icon: Icons.message, onPressed: () {},)
                        ],
                      )),
                ],
              ),

              PagedSliverList<int, VideoData>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<VideoData>(
                    animateTransitions: true,
                    itemBuilder: (context, item, index) => VideoWidget(
                        item.id,
                        item.name,
                        item.video_url,
                        item.described,
                        item.created.substring(0, 10),
                        item.feel,
                        item.comment_mark,
                        item.is_felt,
                        item.author.name,
                        item.author.avatar
                    )
                ),
              ),
            ]),
          )
      ),
    );
  }
}

class VideoAppBarTitle extends StatelessWidget {
  const VideoAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: const Text( 'Videos', style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FontWeight.bold,),),
          )
        ]
    );
  }
}