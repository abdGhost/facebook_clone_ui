import 'package:flutter/material.dart';

Widget circleButton({
  onPress,
  icon,
  size,
}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Icon(
          icon,
          color: Colors.black,
          size: size,
        ),
      ),
    ),
  );
}
