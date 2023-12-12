import 'package:anti_fb/ui/homepage/friendpage/people_page.dart';
import 'package:anti_fb/ui/homepage/menupage/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import '../../constants.dart';
import '../../models/post/PostListData.dart';
import 'friendpage/friendpage/friend_screen.dart';
import 'friendpage/suggestionpage/suggestion_screen.dart';
import 'homepage/home_page.dart';
import 'menupage/personalpage/personal_page.dart';
import 'notificationpage/notification_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  final log = Logger('HomeState');

  late PageController pageController;
  late ScrollController scrollController;

  int _selectedIndex = 0;
  int _pageIndex = 0;

  late String coin = '';
  late String email = '';
  late List<PostListData> postlist = [];

  @override
  void dispose() {
    pageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    } else {
      setState(() {
        _selectedIndex = index;
        _pageIndex = _selectedIndex;
      });
      // pageController.jumpToPage(index);
    }
  }

  void gotoSuggestion() {
    setState(() {
      _pageIndex = 5;
    });
  }

  void backfromSuggestion() {
    setState(() {
      _selectedIndex = 1;
      _pageIndex = _selectedIndex;
    });
  }

  void gotoFriend() {
    setState(() {
      _pageIndex = 6;
    });
  }

  void backfromFriend() {
    setState(() {
      _selectedIndex = 1;
      _pageIndex = _selectedIndex;
    });
  }

  void gotoPersonal() {
    setState(() {
      _pageIndex = 4;
    });
  }

  void backFromPersonal() {
    setState(() {
      _selectedIndex = 3;
      _pageIndex = _selectedIndex;
    });
  }

  // void gotoChangePassword(){setState(() { _pageIndex = 3;});}

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _selectedIndex);
    scrollController = ScrollController();

    // coin = getCoin() as String;
    // initCoin();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(
        email: email,
        coin: coin,
        postlists: postlist,
        scrollController: scrollController,
      ),
      PeoplePage(scrollController: scrollController),
      const NotificationPage(),
      MenuPage(scrollController: scrollController),
      const PersonalPage(),
      const SuggestionScreen(),
      const FriendScreen()
    ];

    return Scaffold(
        // body: PageView(
        //   controller: pageController,
        //   onPageChanged: (index) {
        //     setState(() { _selectedIndex = index; });
        //
        //   },
        //   children: pages,
        body: pages[_pageIndex],
        // ),
        bottomNavigationBar: Visibility(
            child: BottomNavigationBar(
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
          selectedItemColor: FBBLUE,
          unselectedItemColor: GREY,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          showSelectedLabels: true,
          showUnselectedLabels: true,

          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          // Set unselected icon color to grey
        )));
  }
}
