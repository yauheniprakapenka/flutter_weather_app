import 'package:data/data.dart';
import 'package:flutter/material.dart';

import 'src/app/shared/utils/app_version/app_version_dependency.dart';
import 'src/app/weather_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppVersionDependency();
  initDomainDependencies();
  runApp(const WeatherApp());
}
