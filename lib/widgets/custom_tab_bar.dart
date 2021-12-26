import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function ontap;

  const CustomTabBar({
    required this.icons,
    required this.selectedIndex,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
          border:
              Border(top: BorderSide(color: Palette.facebookBlue, width: 5.0))),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  size: 35.0,
                  color: i == selectedIndex ? Palette.facebookBlue: Colors.black45,
                ),
              ),
            ),
          )
          .values
          .toList(),
      onTap:(value)=>ontap,
    );
  }
}
