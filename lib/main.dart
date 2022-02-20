import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app/weather_app.dart';
import 'src/ui/shared/theme/app_colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => AppColors()),
      ],
      child: const WeatherApp(),
    ),
  );
}
