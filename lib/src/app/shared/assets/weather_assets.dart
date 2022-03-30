import 'package:get/get.dart';
import 'package:ui/ui.dart';

class WeatherAssets {
  static final celsius = SvgPicture.asset(
    'assets/icons/weather/celsius.svg',
    color: Get.find<AppColors>().primary,
    height: 44.0,
  );

  static final rain = SvgPicture.asset(
    'assets/icons/weather/rain.svg',
    color: Get.find<AppColors>().primary,
    height: 32.0,
  );

  static final water = SvgPicture.asset(
    'assets/icons/weather/water.svg',
    color: Get.find<AppColors>().primary,
    height: 32.0,
  );

  SvgPicture forecast({required bool isActive}) {
    final appColors = Get.find<AppColors>();
    return SvgPicture.asset(
      'assets/icons/weather/forecast.svg',
      color: isActive ? appColors.primary : appColors.inActive,
    );
  }
}
