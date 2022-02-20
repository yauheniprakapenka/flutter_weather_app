import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../ui/features/forecast_weather/pages/forecast_weather_page.dart';
import '../ui/features/today_weather/pages/today_weather_page.dart';
import '../ui/shared/theme/app_colors.dart';
import '../ui/shared/theme/app_theme.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  var _currentIndex = 0;

  final _pages = const [
    TodayWeatherPage(),
    ForecastWeatherPage(),
  ];

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(context).init(),
      home: Scaffold(
        body: _pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemPressed,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          unselectedItemColor: context.read<AppColors>().inActive,
          items: [
            const BottomNavigationBarItem(
              label: 'Today',
              icon: Icon(Icons.light_mode_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Forecast',
              icon: SvgPicture.asset(
                'assets/icons/forecast.svg',
                color: _currentIndex == 1
                    ? context.read<AppColors>().secondary
                    : context.read<AppColors>().inActive,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
