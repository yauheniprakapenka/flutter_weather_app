import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';

import '../theme/app_colors.dart';

class Assets {
  static final celsius = SvgPicture.asset(
    'assets/icons/celsius.svg',
    color: Get.find<AppColors>().primary,
    height: 44.0,
  );

  static final rain = SvgPicture.asset(
    'assets/icons/rain.svg',
    color: Get.find<AppColors>().primary,
    height: 32.0,
  );

  static final water = SvgPicture.asset(
    'assets/icons/water.svg',
    color: Get.find<AppColors>().primary,
    height: 32.0,
  );

  SvgPicture forecast({required bool isActive}) {
    return SvgPicture.asset(
      'assets/icons/forecast.svg',
      color: isActive ? Get.find<AppColors>().secondary : Get.find<AppColors>().inActive,
    );
  }
}
