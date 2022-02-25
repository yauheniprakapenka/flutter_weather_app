import 'package:domain/domain.dart';
import 'package:flutter_weather_app/src/ui/shared/extensions/week_day_extension.dart';

class ForecastWeatherListWithTitle {
  final List<ForecastWeather> forecastWeather;
  late final String dayTitle;

  ForecastWeatherListWithTitle({required this.forecastWeather}) {
    dayTitle = DateTime.parse(forecastWeather.first.dtText ?? '').weekday.getWeekDayTitle();
  }
}
