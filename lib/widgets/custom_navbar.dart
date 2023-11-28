import 'package:facebook_clone_ui/config/palette.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final List<IconData> icon;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomNavBar({
    super.key,
    required this.icon,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: const BoxDecoration(
        border: Border(
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
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: widget.onTap,
    );
  }
}
