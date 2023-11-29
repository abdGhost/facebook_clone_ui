import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktop;
  final Widget? tablet;
  final Widget mobile;
  const ResponsiveWidget(
      {super.key, required this.desktop, this.tablet, required this.mobile});

  static isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
  static isTabel(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;
  static isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop;
      } else if (constraints.maxWidth <= 800) {
        return tablet ?? mobile;
      } else {
        return mobile;
      }
    });
  }
}
