import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import 'package:provider/provider.dart';

import 'src/app/weather_app.dart';
import 'src/ui/shared/theme/app_colors.dart';

void main() {
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
