import 'package:facebook_clone_ui/widgets/create_room_button.dart';
import 'package:flutter/material.dart';

Widget rooms({onLinUser}) {
  return Container(
    color: Colors.white,
    height: 70.0,
    child: ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
      scrollDirection: Axis.horizontal,
      itemCount: onLinUser.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return createRoomButton();
        }
        return Container(
          margin: const EdgeInsets.all(2.0),
          width: 20,
          height: 20,
          color: Colors.red,
        );
      },
    ),
  );
}
