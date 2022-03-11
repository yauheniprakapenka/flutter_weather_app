import 'package:flutter/material.dart';

import 'src/app/di/domain_dependencies.dart' as di;
import 'src/app/weather_app.dart';

void main() {
  di.initDomainDependencies();
  runApp(const WeatherApp());
}
