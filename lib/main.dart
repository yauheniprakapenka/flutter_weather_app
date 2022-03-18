import 'package:data/data.dart';
import 'package:flutter/material.dart';

import 'src/app/weather_app.dart';

void main() {
  initDomainDependencies();
  runApp(const WeatherApp());
}
