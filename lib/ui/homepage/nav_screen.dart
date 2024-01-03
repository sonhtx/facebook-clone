import 'package:anti_fb/ui/homepage/friendpage/Friends_page.dart';
import 'package:anti_fb/ui/homepage/menupage/menu_screen.dart';
import 'package:anti_fb/ui/homepage/videopage/video_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'homepage/home_page.dart';
import 'notificationpage/notification_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  final log = Logger('HomeState');

  final ScrollController homeScrollController = ScrollController();
  final ScrollController peopleScrollController = ScrollController();
  final ScrollController videoScrollController = ScrollController();
  final ScrollController notificationScrollController = ScrollController();
  final ScrollController menuScrollController = ScrollController();

  final GlobalKey<NavigatorState> homeTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> peopleTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> videoTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> notificationTabNavKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> menuTabNavKey = GlobalKey<NavigatorState>();

  int _selectedIndex = 0;

  late String coin = '';
  late String email = '';

  _onTapped(int index) {
    if (_selectedIndex == index) {
      switch (index) {
        case 0:
          if (homeTabNavKey.currentState!.canPop()) {
            homeTabNavKey.currentState?.popUntil((r) => r.isFirst);
          } else {
            homeScrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        case 1:
          if (peopleTabNavKey.currentState!.canPop()) {
            peopleTabNavKey.currentState?.popUntil((r) => r.isFirst);
          } else {
            peopleScrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        case 2:
          if (videoTabNavKey.currentState!.canPop()) {
            videoTabNavKey.currentState?.popUntil((r) => r.isFirst);
          } else {
            videoScrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        case 3:
          if (notificationTabNavKey.currentState!.canPop()) {
            notificationTabNavKey.currentState?.popUntil((r) => r.isFirst);
          } else {
            notificationScrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
        default:
          if (menuTabNavKey.currentState!.canPop()) {
            menuTabNavKey.currentState?.popUntil((r) => r.isFirst);
          } else {
            menuScrollController.animateTo(
              0.0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
      }
      // firstTabNavKey.currentState?.popUntil((r) => r.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    homeScrollController.dispose();
    peopleScrollController.dispose();
    videoScrollController.dispose();
    notificationScrollController.dispose();
    menuScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            activeColor: CupertinoColors.systemBlue,
            onTap: (index) {
              _onTapped(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined),
                label: 'People',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video_rounded),
                label: 'Videos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
          ),
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  navigatorKey: homeTabNavKey,
                  builder: (context) => HomePage(
                    email: email,
                    coin: coin,
                    scrollController: homeScrollController,
                  ),
                );
              case 1:
                return CupertinoTabView(
                    navigatorKey: peopleTabNavKey,
                    // builder: (context) => PeoplePage(scrollController: peopleScrollController)
                    builder: (context) => FriendsPage());
              case 2:
                return CupertinoTabView(
                    navigatorKey: videoTabNavKey,
                    // builder: (context) => PeoplePage(scrollController: peopleScrollController)
                    builder: (context) =>
                        VideoPage(scrollController: videoScrollController));
              case 3:
                return CupertinoTabView(
                  navigatorKey: notificationTabNavKey,
                  builder: (context) => NotificationPage(
                      scrollController: notificationScrollController),
                );
              default:
                return CupertinoTabView(
                  navigatorKey: menuTabNavKey,
                  builder: (context) =>
                      MenuPage(scrollController: menuScrollController),
                );
            }
          }),
    );
  }
}
