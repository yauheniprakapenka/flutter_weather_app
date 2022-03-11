import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../ui/shared/providers/locale_provider.dart';
import '../../ui/shared/theme/app_colors.dart';
import '../../ui/state_management/weather_bloc/weather_state_management.dart';

class UiDependencies extends StatelessWidget {
  final Widget child;

  const UiDependencies({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AppColors()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: BlocProvider<WeatherBloc>(
        create: (_) => WeatherBloc(),
        child: child,
      ),
    );
  }
}
