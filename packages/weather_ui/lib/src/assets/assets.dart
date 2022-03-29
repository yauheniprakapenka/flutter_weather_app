import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';

import '../../weather_ui.dart';

class Assets {
  static final celsius = SvgPicture.asset(
    'packages/weather_ui/assets/icons/celsius.svg',
    color: Get.find<AppColors>().primary,
    height: 44.0,
  );

  static final rain = SvgPicture.asset(
    'packages/weather_ui/assets/icons/rain.svg',
    color: Get.find<AppColors>().primary,
    height: 32.0,
  );

  static final water = SvgPicture.asset(
    'packages/weather_ui/assets/icons/water.svg',
    color: Get.find<AppColors>().primary,
    height: 32.0,
  );

  SvgPicture forecast({required bool isActive}) {
    final appColors = Get.find<AppColors>();
    return SvgPicture.asset(
      'packages/weather_ui/assets/icons/forecast.svg',
      color: isActive ? appColors.primary : appColors.inActive,
    );
  }
}
