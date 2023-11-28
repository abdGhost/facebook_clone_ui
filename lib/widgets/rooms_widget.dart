import 'package:facebook_clone_ui/widgets/create_room_button.dart';
import 'package:facebook_clone_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

Widget rooms({onLinUser}) {
  return Container(
    color: Colors.white,
    height: 60.0,
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
      scrollDirection: Axis.horizontal,
      itemCount: onLinUser.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return createRoomButton();
        }
        final User user = onLinUser[index - 1];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: profileAvatar(
            imageUrl: user.imageUrl,
            isActive: true,
          ),
        );
      },
    ),
  );
}
