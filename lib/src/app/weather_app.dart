import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_weather_app/src/ui/shared/providers/locale_provider.dart';
import 'package:flutter_weather_app/src/ui/shared/theme/light_theme.dart';
import 'package:provider/provider.dart';

import '../app/di/ui_dependencies.dart';
import '../ui/features/tabbar_navigation/tabbar_navigation_page.dart';
import '../ui/shared/localization/l10n.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const UiDependencies(
      child: _MaterialWeatherApp(),
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
