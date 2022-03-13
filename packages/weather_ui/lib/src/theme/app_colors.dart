import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;

  Color get secondary;

  Color get divider;

  Color get foregroundTextButton;

  Color get inActive;

  Color get onBackground;
}

class WeatherAppColors implements AppColors {
  @override
  Color get primary => const Color(0xFFf6cd55);

  @override
  Color get secondary => const Color(0xFF4e91f7);

  @override
  Color get divider => const Color(0xFFE0E0E0);

  @override
  Color get foregroundTextButton => const Color(0xFFf09763);

  @override
  Color get inActive => const Color(0xFF616161);

  @override
  Color get onBackground => const Color(0xFF000000);
}
