import 'package:flutter/material.dart';

import '../config/weather_indicator_icon_config.dart';

class EmptySpace extends StatelessWidget {
  const EmptySpace({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const SizedBox.square(
      dimension: WeatherIndicatorIconConfig.thicknessLine + 2,
    );
  }
}
