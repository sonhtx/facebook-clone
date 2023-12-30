import 'package:anti_fb/ui/homepage/friendpage/Friends_page.dart';
import 'package:anti_fb/ui/homepage/menupage/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'homepage/home_page.dart';
import 'notificationpage/notification_page.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => HomeState();
// }
//
// class HomeState extends State<HomeScreen> with TickerProviderStateMixin {
//   final log = Logger('HomeState');
//
//   late PageController pageController;
//   late ScrollController scrollController;
//   late TabController tabController;
//
//   int _selectedIndex = 0;
//   int _pageIndex = 0;
//
//   late String coin = '';
//   late String email = '';
//   late List<PostListData> postlist = [];
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     scrollController.dispose();
//     tabController.dispose();
//     super.dispose();
//   }
//
//   void _onItemTapped(int index) {
//     if (_selectedIndex == index) {
//       if(scrollController.hasClients){
//         scrollController.animateTo(
//           0.0,
//           curve: Curves.easeOut,
//           duration: const Duration(milliseconds: 300),
//         );
//       }
//
//     } else {
//       setState(() {
//         _selectedIndex = index;
//         _pageIndex = _selectedIndex;
//       });
//       pageController.jumpToPage(index);
//     }
//   }
//
//   void gotoSuggestion() {
//     setState(() {
//       _pageIndex = 5;
//     });
//   }
//
//   void backfromSuggestion() {
//     setState(() {
//       _selectedIndex = 1;
//       _pageIndex = _selectedIndex;
//     });
//   }
//
//   void gotoFriend() {
//     setState(() {
//       _pageIndex = 6;
//     });
//   }
//
//   void backfromFriend() {
//     setState(() {
//       _selectedIndex = 1;
//       _pageIndex = _selectedIndex;
//     });
//   }
//
//   void gotoPersonal() {
//     setState(() {
//       _pageIndex = 4;
//     });
//   }
//
//   void backFromPersonal() {
//     setState(() {
//       _selectedIndex = 3;
//       _pageIndex = _selectedIndex;
//     });
//   }
//
//   // void gotoChangePassword(){setState(() { _pageIndex = 3;});}
//   void onPageChanged(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     pageController.addListener(() {
//       tabController.animateTo(pageController.page!.round());
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     pageController = PageController(initialPage: _selectedIndex);
//     scrollController = ScrollController();
//     tabController = TabController(length: 4, vsync: this);
//     // coin = getCoin() as String;
//     // initCoin();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> pages = [
//       HomePage(
//         email: email,
//         coin: coin,
//         postlists: postlist,
//         scrollController: scrollController,
//       ),
//       PeoplePage(scrollController: scrollController),
//       NotificationPage(scrollController: scrollController),
//       MenuPage(scrollController: scrollController),
//       const PersonalPage(),
//       const SuggestionScreen(),
//       const FriendScreen()
//     ];
//
//     return Scaffold(
//         // body: PageView(
//         //   controller: pageController,
//         //   onPageChanged: onPageChanged,
//         //   children: pages,
//         // ),
//         body: pages[_pageIndex],
//         // ),
//         bottomNavigationBar: Visibility(
//             child: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.people_alt_outlined),
//               label: 'People',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.notifications),
//               label: 'Notifications',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.menu),
//               label: 'Menu',
//             ),
//           ],
//           selectedItemColor: FBBLUE,
//           unselectedItemColor: GREY,
//           selectedFontSize: 10,
//           unselectedFontSize: 10,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           // Set unselected icon color to grey
//         )));
//   }
// }
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  final log = Logger('HomeState');

  final ScrollController homeScrollController = ScrollController();
  final ScrollController peopleScrollController = ScrollController();
  final ScrollController notificationScrollController = ScrollController();
  final ScrollController menuScrollController = ScrollController();

  final GlobalKey<NavigatorState> homeTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> peopleTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> notificationTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> menuTabNavKey = GlobalKey<NavigatorState>();

  int _selectedIndex = 0;

  late String coin = '';
  late String email = '';
  _onTapped(int index) {
    if (_selectedIndex == index) {
      switch(index){
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
                    builder: (context) => FriendsPage()
                );
              case 2:
                return CupertinoTabView(
                  navigatorKey: notificationTabNavKey,
                  builder: (context) => NotificationPage(scrollController: notificationScrollController),
                );
              default:
                return CupertinoTabView(
                  navigatorKey: menuTabNavKey,
                  builder: (context) => MenuPage(scrollController: menuScrollController),
                );
            }
          }),
    );
  }
}
