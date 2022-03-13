import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_ui/weather_ui.dart';

import '../../features/forecast_weather/pages/forecast_weather_page.dart';
import '../../features/today_weather/pages/today_weather_page.dart';
import '../../shared/localization/extensions/l10n_extension.dart';

class TabbarNavigationPage extends StatefulWidget {
  const TabbarNavigationPage({Key? key}) : super(key: key);

  @override
  State<TabbarNavigationPage> createState() => _TabbarNavigationPageState();
}

class _TabbarNavigationPageState extends State<TabbarNavigationPage> {
  var _currentIndex = 0;

  final _pages = const [
    TodayWeatherPage(),
    ForecastWeatherPage(),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemPressed,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        unselectedItemColor: Get.find<AppColors>().inActive,
        items: [
          BottomNavigationBarItem(
            label: context.l10n?.tabbarNavigationTodayLabel ?? '-',
            icon: const Icon(Icons.light_mode_outlined),
          ),
          BottomNavigationBarItem(
            label: context.l10n?.tabbarNavigationForecaseLabel ?? '-',
            icon: Assets().forecast(isActive: _currentIndex == 1),
          ),
        ],
      ),
    );
  }

  void _onItemPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
