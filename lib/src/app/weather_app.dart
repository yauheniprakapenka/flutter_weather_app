import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../ui/features/forecast_weather/bloc/forecast_bloc.dart';
import '../ui/features/tabbar_navigation/tabbar_navigation_page.dart';
import '../ui/features/today_weather/bloc/today_weather_bloc.dart';
import '../ui/shared/providers/locale_provider.dart';
import '../ui/shared/theme/app_colors.dart';
import '../ui/shared/theme/light_theme.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AppColors()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
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
      theme: LightTheme(context).init(),
      locale: Provider.of<LocaleProvider>(context).locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const TabbarNavigationPage(),
    );
  }
}
