import 'package:facebook_clone_ui/data/data.dart';
import 'package:facebook_clone_ui/views/home_screen.dart';
import 'package:facebook_clone_ui/widgets/circle_button.dart';
import 'package:facebook_clone_ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/user_model.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/user_card_Widget.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  List<IconData> icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    Icons.menu
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: icons.length,
      child: Scaffold(
        appBar: ResponsiveWidget.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: _CustomAppbar(
                    currentUser: currentUser,
                    icons: icons,
                    index: _selectedIndex,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }),
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: !ResponsiveWidget.isDesktop(context)
            ? Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomNavBar(
                    icon: icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    }),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int index;
  final Function(dynamic) onTap;
  const _CustomAppbar({
    required this.currentUser,
    required this.icons,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 250, 246, 246),
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          SizedBox(
            width: 600.0,
            child:
                CustomNavBar(icon: icons, selectedIndex: index, onTap: onTap),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCardWidget(user: currentUser),
                circleButton(icon: Icons.search, size: 30.0, onPress: () {}),
                circleButton(
                    icon: MdiIcons.facebookMessenger,
                    size: 30.0,
                    onPress: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
