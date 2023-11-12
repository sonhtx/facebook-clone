import 'package:anti_fb/ui/homepage/profile.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../widgets/custom_tab_bar.dart';
import 'home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with TickerProviderStateMixin {
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const Scaffold(
    ),
    const Scaffold(
    ),
  ];

  late PageController pageController;
  late TabController tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    pageController = PageController();
  }


  @override
  void dispose() {
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

  _onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
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
            children: _screens,
          ),
          bottomNavigationBar: CustomTabBar(
            controller: tabController,
            icons:_icons,
            onTap: _onTapped,
            selectedIndex: _selectedIndex,
          ),
        ),
    );
  }


}
