import 'package:facebook_clone_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

Widget createPostContainer({User? user}) {
  return Container(
    padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
    color: Colors.white,
    child: Column(
      children: [
        Row(
          children: [
            // Profile Avatar
            profileAvatar(
              imageUrl: user?.imageUrl,
              isActive: false,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?'),
              ),
            ),
          ],
        ),
        const Divider(height: 10.0, thickness: 0.5),
        SizedBox(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.videocam, color: Colors.red),
                label: const Text(
                  'Video',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const VerticalDivider(width: 8.0),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.photo_library, color: Colors.green),
                label: const Text(
                  'Photo',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const VerticalDivider(width: 8.0),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.video_call, color: Colors.purpleAccent),
                label: const Text(
                  'Room',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
