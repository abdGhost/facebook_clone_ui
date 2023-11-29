import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  const ResponsiveWidget(
      {super.key,
      required this.desktop,
      required this.tablet,
      required this.mobile});

  static isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
  static isTabel(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;
  static isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth >= 1800) {
        return desktop;
      } else if (constraint.maxWidth >= 800) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
