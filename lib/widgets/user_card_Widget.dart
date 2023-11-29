// ignore: file_names
import 'package:facebook_clone_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserCardWidget extends StatelessWidget {
  final User user;
  const UserCardWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        profileAvatar(imageUrl: user.imageUrl),
        const SizedBox(width: 8.0),
        Text(
          user.name,
          style: const TextStyle(fontSize: 16.0),
        )
      ],
    );
  }
}
