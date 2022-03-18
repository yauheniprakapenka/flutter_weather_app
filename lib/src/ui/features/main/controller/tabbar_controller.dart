import 'package:flutter/material.dart';

import '../../forecast_weather/pages/forecast_weather_page.dart';
import '../../today_weather/pages/today_weather_page.dart';

class TabbarController extends ChangeNotifier {
  final pages = const [
    TodayWeatherPage(),
    ForecastWeatherPage(),
  ];

  var _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
