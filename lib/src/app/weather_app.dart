import 'package:flutter/material.dart';

import '../ui/features/forecast_weather/pages/forecast_weather_page.dart';
import '../ui/shared/theme/app_theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(context).init(),
      home: const ForecastWeatherPage(),
    );
  }
}
