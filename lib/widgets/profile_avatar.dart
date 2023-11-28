import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget profileAvatar({imageUrl, isActive = false}) {
  return CircleAvatar(
    radius: 20,
    backgroundColor: Colors.grey[200],
    backgroundImage: CachedNetworkImageProvider(imageUrl),
  );
}
