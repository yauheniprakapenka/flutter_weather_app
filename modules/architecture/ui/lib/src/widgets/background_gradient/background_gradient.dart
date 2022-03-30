import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors/app_colors.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget child;

  const BackgroundGradient({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: Get.find<AppColors>().backgroundGradient,
        ),
      ),
      child: child,
    );
  }
}
