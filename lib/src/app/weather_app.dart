import 'package:flutter/material.dart';

import '../ui/features/today_weather/pages/today_weather_page.dart';
import '../ui/shared/theme/weather_data_theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getWeatherAppTheme(),
      home: const TodayWeatherPage(),
    );
  }
}
