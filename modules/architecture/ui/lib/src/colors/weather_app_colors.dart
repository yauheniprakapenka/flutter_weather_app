import 'package:flutter/material.dart';

import 'app_colors.dart';

class WeatherAppColors implements AppColors {
  @override
  Color get primary => Colors.white;

  @override
  Color get secondary => const Color(0xFF4e91f7);

  @override
  Color get divider => const Color(0xFFE0E0E0);

  @override
  Color get foregroundTextButton => const Color(0xFFf09763);

  @override
  Color get inActive => const Color.fromARGB(255, 151, 150, 150);

  @override
  Color get onBackground => const Color(0xFF000000);

  @override
  Color get accent => Colors.white;

  @override
  Color get backgroundGradientStart => const Color(0xFF4480C6);

  @override
  Color get backgroundGradientEnd => const Color(0xFF364699);

  @override
  List<Color> get backgroundGradient => [backgroundGradientStart, backgroundGradientEnd];
}
