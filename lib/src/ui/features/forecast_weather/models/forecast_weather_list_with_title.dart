import 'package:domain/domain.dart';

class ForecastWeatherListWithTitle {
  final List<ForecastWeather> forecastWeather;
  late final int numberDayOfWeek;

  ForecastWeatherListWithTitle(this.forecastWeather) {
    numberDayOfWeek = DateTime.parse(forecastWeather.first.dtText ?? '').weekday;
  }
}
