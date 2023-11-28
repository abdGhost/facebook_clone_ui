import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone_ui/config/palette.dart';
import 'package:flutter/material.dart';

Widget profileAvatar({imageUrl, isActive = false}) {
  return Stack(
    children: [
      CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey[200],
        backgroundImage: CachedNetworkImageProvider(imageUrl),
      ),
      isActive == true
          ? Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                width: 15.0,
                height: 15.0,
                decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2.0, color: Colors.white)),
              ),
            )
          : const SizedBox.shrink()
    ],
  );
}
