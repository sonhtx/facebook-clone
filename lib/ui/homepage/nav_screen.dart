//
// import 'package:anti_fb/ui/homepage/friendpage/people_page.dart';
// import 'package:flutter/material.dart';
//
// import '../../models/post/PostListData.dart';
// import '../../widgets/custom_tab_bar.dart';
// import 'friendpage/suggestionpage/suggestion_screen.dart';
// import 'homepage/home_page.dart';
// import 'menupage/menu_screen.dart';
// import 'notificationpage/notification_page.dart';
//
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//
//
// class NavScreen extends StatefulWidget {
//   const NavScreen({super.key});
//
//   @override
//   State<NavScreen> createState() => NavScreenState();
// }
//
// class NavScreenState extends State<NavScreen> with TickerProviderStateMixin {
//
//
//   late PageController pageController;
//   late TabController tabController;
//   late ScrollController scrollController;
//
//
//   int _selectedIndex = 0;
//   int _pageIndex = 0;
//
//   late String coin = '';
//   late String email = '';
//   late List<PostListData> postlist = [];
//
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 4, vsync: this);
//     pageController = PageController();
//
//     scrollController = ScrollController();
//   }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     tabController.dispose();
//
//     scrollController.dispose();
//
//     super.dispose();
//   }
//
//   final List<IconData> _icons = [
//     Icons.home,
//     MdiIcons.accountCircleOutline,
//     MdiIcons.bellOutline,
//     Icons.menu,
//   ];
//
//   _onTapped(int index){
//     if (_selectedIndex == index) {
//       if (index == 0) {
//         scrollController.animateTo(
//           0.0,
//           curve: Curves.easeOut,
//           duration: const Duration(milliseconds: 300),
//         );
//       } else {
//         pageController.animateTo(
//           0.0,
//           curve: Curves.easeOut,
//           duration: const Duration(milliseconds: 300),
//         );
//       }
//     } else {
//       setState(() {
//         _selectedIndex = index;
//         _pageIndex = _selectedIndex;
//       });
//       pageController.jumpToPage(index);
//     }
//   }
//
//
//   void onPageChanged(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     pageController.addListener(() {
//       tabController.animateTo(pageController.page!.round());
//     });
//   }
//
//   void gotoSuggestion(){setState(() { _pageIndex = 4; });}
//   void backfromSuggestion(){setState(() { _selectedIndex = 1; _pageIndex = _selectedIndex;});}
//
//   @override
//   Widget build(BuildContext context) {
//
//     final List<Widget> screens = [
//       HomePage(email: email, coin: coin, postlists: postlist, scrollController: scrollController,),
//       const PeoplePage(),
//       const NotificationPage(),
//       const MenuPage(),
//       SuggestionScreen(scrollController: scrollController,),
//
//       // const PersonalPage(),
//     ];
//
//     return DefaultTabController(
//         length: _icons.length,
//         child: Scaffold(
//           body: PageView(
//             controller: pageController,
//             onPageChanged: onPageChanged,
//             children: screens,
//           ),
//           bottomNavigationBar: CustomTabBar(
//             controller: tabController,
//             icons:_icons,
//             onTap: _onTapped,
//             selectedIndex: _selectedIndex,
//           ),
//         ),
//     );
//   }
//
//
// }
