import 'package:facebook_clone_ui/config/palette.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final List<IconData> icon;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomTab;
  const CustomNavBar({
    super.key,
    required this.icon,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomTab = false,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border: widget.isBottomTab == true
            ? const Border(
                bottom: BorderSide(color: Palette.facebookBlue, width: 3.0),
              )
            : const Border(
                top: BorderSide(color: Palette.facebookBlue, width: 3.0),
              ),
      ),
      tabs: widget.icon
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == widget.selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: widget.onTap,
    );
  }
}
