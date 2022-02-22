import 'package:flutter_weather_app/src/domain/lib/domain.dart';

import '../../models/forecast_weather_list_with_title.dart';

class ForecastDayFilter {
  List<ForecastWeatherListWithTitle> getForecastWeatherListWithTitle(Forecast forecast) {
    final countedDays = _countDays(forecast);
    final emptyDaysList = _createEmptySkeletonDaysList(countedDays);
    final sortedByDay = _sortByDay(emptyDaysList, forecast);

    final forecastListWithTitle = <ForecastWeatherListWithTitle>[];
    for (var i = 0; i < countedDays; i++) {
      forecastListWithTitle.add(ForecastWeatherListWithTitle(forecastWeather: sortedByDay[i]));
    }
    return forecastListWithTitle;
  }

  static int _countDays(Forecast forecast) {
    final days = <int>{};
    forecast.weather?.forEach((e) {
      days.add(DateTime.parse(e.dtText ?? '').day);
    });
    return days.length;
  }

  static List<List<ForecastWeather>> _createEmptySkeletonDaysList(int length) {
    return List.generate(length, (_) => <ForecastWeather>[]);
  }

  static List<List<ForecastWeather>> _sortByDay(List<List<ForecastWeather>> emptyDaysList, Forecast forecast) {
    var _daysIndex = 0;
    var _currentDay = 0;
    for (var i = 0; i < (forecast.weather?.length ?? 0); i++) {
      final time = DateTime.parse(forecast.weather?[i].dtText ?? '').day;
      if (i == 0) {
        _currentDay = time;
      } else {
        if (_currentDay != time) {
          _currentDay = time;
          _daysIndex++;
        }
      }

      if (forecast.weather?[i] != null) {
        emptyDaysList[_daysIndex].add(forecast.weather![i]);
      }
    }
    return emptyDaysList;
  }
}
