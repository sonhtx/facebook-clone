import 'package:anti_fb/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  final TabController controller;

  const CustomTabBar(
      {super.key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: DecoratedBox(
        decoration: BoxDecoration(
          //This is for background color
          color: Colors.white.withOpacity(0.0),

          //This is for bottom border that is needed
          border: const Border(
              top: BorderSide(color: Colors.black, width: 0.2)),
        ),
        child: TabBar(
          controller: controller,
          indicatorPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Constants.facebookBlue,
                width: 2.0,
              ),
            ),
          ),
          tabs: icons
              .asMap()
              .map((i, e) => MapEntry(
                    i,
                    Tab(
                      icon: Icon(
                        e,
                        color: i == selectedIndex
                            ? Constants.facebookBlue
                            : Colors.black45,
                        size: 30.0,
                      ),
                    ),
                  ))
              .values
              .toList(),
          onTap: onTap,
        ),
      ),
    );
  }
}
