import 'package:anti_fb/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({super.key, required this.icons, required this.selectedIndex, required this.onTap,this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          border: isBottomIndicator
              ? const Border(
            bottom: BorderSide(
              color: Constants.facebookBlue,
              width: 3.0,
            ),
          )
              : const Border(
            top: BorderSide(
              color: Constants.facebookBlue,
              width: 3.0,
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
    );
  }
}
