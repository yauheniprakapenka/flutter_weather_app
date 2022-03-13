import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_weather_app/src/ui/shared/providers/locale_provider.dart';
import 'package:flutter_weather_app/src/ui/shared/theme/light_theme.dart';
import 'package:provider/provider.dart';

import '../ui/features/tabbar_navigation/tabbar_navigation_page.dart';
import '../ui/shared/bloc/weather_bloc/weather.dart';
import '../ui/shared/localization/l10n.dart';
import '../ui/shared/theme/app_colors.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AppColors()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: BlocProvider<WeatherBloc>(
        create: (_) => WeatherBloc(),
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
      supportedLocales: L10n.all,
      home: const TabbarNavigationPage(),
    );
  }
}
