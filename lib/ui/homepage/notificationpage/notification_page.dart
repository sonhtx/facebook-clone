import 'package:anti_fb/models/request/ReqListNotification.dart';
import 'package:anti_fb/repository/notification/notification_repo.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../constants.dart';
import '../../../models/Notification/NotificationData.dart';
import '../../../widgets/IconWidget.dart';
import '../search/search_tab.dart';
import 'NotificationWidget.dart';


class NotificationPage extends StatefulWidget{

  final ScrollController scrollController;
  const NotificationPage({super.key, required this.scrollController});


  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  static const _pageSize = 5;

  final PagingController<int, NotificationData> _pagingController =
  PagingController(firstPageKey: 1);


  final NotificationRepository _notificationRepository = NotificationRepository();
  //
  int init = 0;
  late RequestListNotification requestListNotification = RequestListNotification(init.toString(), "10");

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

  Future<void> _fetchPage(pageKey) async {
    try {
      List<NotificationData>? listNotification = await _notificationRepository.getListNotification(requestListNotification);
      setState(() {
        init+=10;
        requestListNotification = RequestListNotification(init.toString(), "10");
      });
      if(listNotification!=null){
        final isLastPage = listNotification.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(listNotification);
        } else {
          final nextPageKey = pageKey + 1;
          _pagingController.appendPage(listNotification, nextPageKey);
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
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
              init = 0;
              requestListNotification = RequestListNotification(init.toString(), "10");
            });
            return Future.sync(
                  ()=>_pagingController.refresh(),
            );
          } ,
          child: CustomScrollView(
            controller: widget.scrollController,
            slivers: <Widget>[
              SliverAppBar(
                title: const NotificationsAppBarTitle(),
                actions:  [
                  Row(
                    children: [
                      IconWidget(icon: Icons.settings, onPressed: () {},),
                      Padding(
                          padding: const EdgeInsets.only(right: 5), //
                          child: IconWidget( icon: Icons.search,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchTab()));
                            },
                          )
                      ),
                    ],
                  ),
                ],
                backgroundColor: WHITE,
                floating: true,
              ),
              // SliverList(
              //     delegate: SliverChildListDelegate( [
              //       for(NotificationData notification in _notificationLists) NotificationWidget(notification: notification)
              //     ]
              //     )
              // ),
              PagedSliverList<int, NotificationData>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<NotificationData>(
                  animateTransitions: true,
                  itemBuilder: (context, item, index) => NotificationWidget(
                    notification: item,
                  )
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

class NotificationsAppBarTitle extends StatelessWidget {
  const NotificationsAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: const Text( 'Notifications', style: TextStyle(color: BLACK, fontSize: 20, fontWeight: FONTBOLD,),),
          )
        ]
    );
  }
}