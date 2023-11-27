import 'package:facebook_clone_ui/config/palette.dart';
import 'package:facebook_clone_ui/data/data.dart';
import 'package:facebook_clone_ui/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/create_post_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            centerTitle: false,
            floating: true,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              circleButton(
                onPress: () {},
                icon: Icons.search,
                size: 30.0,
              ),
              circleButton(
                onPress: () {},
                icon: MdiIcons.facebookMessenger,
                size: 30.0,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: createPostContainer(user: currentUser),
          )
        ],
      ),
    );
  }
}
