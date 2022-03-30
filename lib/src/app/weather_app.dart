import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:ui/ui.dart';

import '../ui/features/forecast_weather/bloc/forecast_bloc.dart';
import '../ui/features/main/controller/tabbar_controller.dart';
import '../ui/features/main/main_page.dart';
import '../ui/features/today_weather/bloc/today_weather_bloc.dart';
import 'shared/localization/locale_provider.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    Get.put<AppColors>(WeatherAppColors());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => TabbarController()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TodayWeatherBloc>(create: (_) => TodayWeatherBloc()),
          BlocProvider<ForecastBloc>(create: (_) => ForecastBloc()),
        ],
        child: const _MaterialWeatherApp(),
      ),
    );
  }
}

class _MaterialWeatherApp extends StatelessWidget {
  const _MaterialWeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: WeatherTheme.light(),
      locale: Provider.of<LocaleProvider>(context).locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MainPage(),
    );
  }
}
