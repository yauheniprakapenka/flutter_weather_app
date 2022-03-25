import 'package:flutter/material.dart';

class Adaptive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static const _mobileMaxWidth = 650.0;
  static const _tabletMaxWidth = 900.0;

  const Adaptive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < _mobileMaxWidth;
  }

  static bool isTablet(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return currentWidth < _tabletMaxWidth && currentWidth >= _mobileMaxWidth;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= _tabletMaxWidth;
  }

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        if (constraints.maxWidth >= _tabletMaxWidth) return desktop;
        if (constraints.maxWidth >= _mobileMaxWidth) return tablet;
        return mobile;
      },
    );
  }
}
