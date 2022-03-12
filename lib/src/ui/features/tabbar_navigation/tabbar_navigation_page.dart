import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../features/forecast_weather/pages/forecast_weather_page.dart';
import '../../features/today_weather/pages/today_weather_page.dart';
import '../../shared/theme/app_colors.dart';

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
        unselectedItemColor: context.read<AppColors>().inActive,
        items: [
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)?.today ?? '',
            icon: const Icon(Icons.light_mode_outlined),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)?.forecast ?? '',
            icon: SvgPicture.asset(
              'assets/icons/forecast.svg',
              color: _currentIndex == 1
                  ? context.read<AppColors>().secondary
                  : context.read<AppColors>().inActive,
            ),
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
