import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_ui/config/palette.dart';
import 'package:facebook_clone_ui/models/models.dart';
import 'package:facebook_clone_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final dynamic currentUser;
  final dynamic stories;
  const Stories({super.key, this.currentUser, this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          scrollDirection: Axis.horizontal,
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: _StoriesCard(story: story),
            );
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
    this.isAddStory = false,
    this.story,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl:
                isAddStory == true ? currentUser!.imageUrl : story!.imageUrl,
            height: 200,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          width: 110,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0)),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory == true
              ? Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Palette.facebookBlue,
                    ),
                  ),
                )
              : profileAvatar(
                  imageUrl: story!.user.imageUrl, hasBorder: story!.isViewed),
        ),
        Positioned(
          bottom: 8.0,
          right: 8.0,
          left: 8.0,
          child: Text(
            isAddStory == true ? 'Add to story' : story!.user.name,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
