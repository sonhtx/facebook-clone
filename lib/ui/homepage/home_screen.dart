
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../storage.dart';
import 'homepage/home_page.dart';
import 'menupage/menu_page.dart';
import 'menupage/personalpage/personal_page.dart';
import 'notificationpage/notification_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _pageIndex = 0;
  late String coin = '';
  late String email = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageIndex = _selectedIndex;
    });
  }

  void gotoPersonal(){ setState(() { _pageIndex = 3;});}
  void backFromPersonal(){ setState(() { _selectedIndex = 2; _pageIndex = _selectedIndex;});}

  // void gotoChangePassword(){setState(() { _pageIndex = 3;});}

  @override
  void initState() {
    super.initState();
    // coin = getCoin() as String;
    initCoin();
  }
  Future<void> initCoin() async {
    // Perform your asynchronous actions here after the widget is initialized.
    String? coinValue = await getCoin(); // Use await to get the value from the Future.
    String? emailValue = await getEmail();
    coin = coinValue!;
    email = emailValue!;
    print(coin);
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      HomePage(email: email, coin: coin),
      const NotificationPage(),
      const MenuPage(),
      const PersonalPage(),

    ];

    late PageController pageController;
    late TabController tabController;

    // double _appBarBottomBtnPosition = MediaQuery.of(context).size.height - 105; //ch

    // TODO: implement build
    return Scaffold(
      body: pages[_pageIndex],
      bottomNavigationBar:  Visibility(
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem( icon: Icon(Icons.home), label: 'Home',),
              BottomNavigationBarItem( icon: Icon(Icons.notifications), label: 'Notifications',),
              BottomNavigationBarItem( icon: Icon(Icons.menu), label: 'Menu',),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: FBBLUE,
            unselectedItemColor: GREY, // Set unselected icon color to grey
          )
      )
    );
  }
}


