import 'package:anti_fb/ui/homepage/profile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/custom_tab_bar.dart';
import 'home_screen.dart';
import 'menu_screen.dart';
import 'notification_screen.dart';

  class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with TickerProviderStateMixin {

  final ScrollController scrollController = ScrollController();
  late PageController pageController;
  late TabController tabController;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    pageController = PageController();
    // scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    pageController.dispose();
    tabController.dispose();
    super.dispose();
  }

  final List<IconData> _icons = [
    Icons.home,
    MdiIcons.accountCircleOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  _onTapped(int index) {
    if (_selectedIndex == index) {
        scrollController.animateTo(
          0.0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
    } else {
      setState(() {
        _selectedIndex = index;
      });
      pageController.jumpToPage(index);
    }
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.addListener(() {
      tabController.animateTo(pageController.page!.round());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [
            HomeScreen(scrollController: scrollController),
            const ProfileScreen(),
            NotificationsTab(scrollController: scrollController),
            MenuTab(scrollController: scrollController),
          ],
        ),
        bottomNavigationBar: CustomTabBar(
          controller: tabController,
          icons: _icons,
          onTap: _onTapped,
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}
