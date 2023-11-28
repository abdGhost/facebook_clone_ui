import 'package:flutter/material.dart';

Widget rooms({onLinUser}) {
  return Container(
    color: Colors.orange,
    height: 60.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: onLinUser.length + 1,
      itemBuilder: (context, index) {
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
