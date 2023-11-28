import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_ui/config/palette.dart';
import 'package:facebook_clone_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/post_model.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 4.0),
                Text(post.caption),
                post.imageUrl.isEmpty
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6.0)
              ],
            ),
          ),
          post.imageUrl.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.user.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        profileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} * ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12.0),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({required this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: 10.0,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(width: 8.0),
            Text(
              '${post.shares} shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(MdiIcons.thumbUpOutline,
                  size: 20, color: Colors.grey[600]),
              onTap: () {},
              label: 'Likes',
            ),
            _PostButton(
              icon: Icon(MdiIcons.commentOutline,
                  size: 20, color: Colors.grey[600]),
              onTap: () {},
              label: 'Comments',
            ),
            _PostButton(
              icon: Icon(MdiIcons.shareOutline,
                  size: 25, color: Colors.grey[600]),
              onTap: () {},
              label: 'Share',
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function() onTap;
  const _PostButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
