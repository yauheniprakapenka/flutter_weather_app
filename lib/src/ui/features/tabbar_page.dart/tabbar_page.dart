import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../shared/theme/app_colors.dart';
import '../forecast_weather/pages/forecast_weather_page.dart';
import '../today_weather/pages/today_weather_page.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({Key? key}) : super(key: key);

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
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
    );
  }

  void _onItemPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
