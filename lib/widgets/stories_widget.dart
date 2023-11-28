import 'package:facebook_clone_ui/models/models.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final dynamic currentUser;
  final dynamic stories;
  const Stories({super.key, this.currentUser, this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.purple,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          itemCount: stories.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _StoriesCard(
                  isAddStory: true,
                  currentUser: currentUser,
                ),
              );
            }
            final story = stories[index - 1];
            return _StoriesCard(story: story);
          }),
    );
  }
}

class _StoriesCard extends StatelessWidget {
  final bool? isAddStory;
  final User? currentUser;
  final Story? story;

  const _StoriesCard({
    this.currentUser,
    this.isAddStory,
    this.story,
  });
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
