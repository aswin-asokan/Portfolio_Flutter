import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;
  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 768;
  static bool isSmallTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1024 &&
      MediaQuery.sizeOf(context).width >= 768;
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1280 &&
      MediaQuery.sizeOf(context).width >= 1024;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 1460 &&
      MediaQuery.sizeOf(context).width >= 1280;
  static bool isDesktopLarge(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1460;
  static double padding(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    if (width > 1600) {
      return (width - 1480) / 2;
    } else if (width >= 1280) {
      return 60;
    } else if (width >= 1024) {
      return 40;
    } else {
      return 10;
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    if (size.width >= 1280) {
      return desktop;
    } else if (size.width >= 904 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
