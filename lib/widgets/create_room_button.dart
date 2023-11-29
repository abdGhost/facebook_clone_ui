import 'package:facebook_clone_ui/config/palette.dart';
import 'package:facebook_clone_ui/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveWidget.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
          : null,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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
              child: const Row(
                children: [
                  Icon(
                    Icons.video_call,
                    size: 35.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Create\nRoom',
                    style: TextStyle(color: Palette.facebookBlue),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
