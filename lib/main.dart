

import 'package:flutter/material.dart';

import 'src/app/di/domain_dependencies.dart';
import 'src/app/weather_app.dart';

void main() {
  initDomainDependencies();
  runApp(const WeatherApp());
}
