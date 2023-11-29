import 'package:facebook_clone_ui/config/palette.dart';
import 'package:facebook_clone_ui/data/data.dart';
import 'package:facebook_clone_ui/widgets/circle_button.dart';
import 'package:facebook_clone_ui/widgets/responsive_widget.dart';
import 'package:facebook_clone_ui/widgets/rooms_widget.dart';
import 'package:facebook_clone_ui/widgets/stories_widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/post_model.dart';
import '../widgets/create_post_container.dart';
import '../widgets/posts_container_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveWidget(
        mobile: _HomeScreenMobile(),
        desktop: _HomeScreenDesktop(),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
        const SliverToBoxAdapter(
          child: CreatePostContainer(user: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: rooms(onLinUser: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(
              currentUser: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 600,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: CreatePostContainer(user: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: rooms(onLinUser: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
