import 'package:facebook_clone_ui/config/palette.dart';
import 'package:flutter/material.dart';

Widget createRoomButton() {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        backgroundColor: Colors.white,
        side: const BorderSide(
          width: 3.0,
          color: Colors.blueAccent,
        ),
        textStyle: const TextStyle(color: Palette.facebookBlue)),
    onPressed: () {},
    child: Row(
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) =>
              Palette.createRoomGradient.createShader(bounds),
          child: const Icon(
            Icons.video_call,
            size: 35.0,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 8.0),
        const Text(
          'Create\nRoom',
          style: TextStyle(color: Palette.facebookBlue),
        )
      ],
    ),
  );
}
