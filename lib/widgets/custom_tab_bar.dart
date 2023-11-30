import 'package:anti_fb/constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  final TabController controller;

  const CustomTabBar({super.key, required this.icons, required this.selectedIndex, required this.onTap, this.isBottomIndicator = false,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: WHITE,
      child: TabBar(
        controller: controller,
        indicatorPadding: EdgeInsets.zero,
        indicator: const BoxDecoration(
          border:  Border(
            top: BorderSide(
              color: FBBLUE,
              width: 3.0,
            ),
          ),
        ),
        tabs: icons
            .asMap() .map((i, e) => MapEntry(i,
          Tab(
            icon: Icon(
              e,
              color: i == selectedIndex
                  ? FBBLUE
                  : Colors.black45,
              size: 30.0,
            ),
            // text: ,
          ),
        ))
            .values
            .toList(),
        onTap: onTap,
      ),
    );
  }
}
