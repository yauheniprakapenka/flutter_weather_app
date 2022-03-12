import 'forecast_weather.dart';

class Forecast {
  final List<ForecastWeather>? weather;
  final String? city;

  const Forecast({this.weather, this.city});
}
