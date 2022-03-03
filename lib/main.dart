import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'src/app/di.dart' as di;
import 'src/app/weather_app.dart';
import 'src/ui/shared/theme/app_colors.dart';
import 'src/ui/state_management/weather_bloc/weather_bloc.dart';

void main() {
  di.init();
  runApp(
    BlocProvider<WeatherBloc>(
      create: (_) => WeatherBloc(),
      child: Provider(
        create: (_) => AppColors(),
        child: const WeatherApp(),
      ),
    ),
  );
}
