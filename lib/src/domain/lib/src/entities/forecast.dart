class Forecast {
  final List<ForecastWeather>? weather;
  final String? city;

  Forecast({this.weather, this.city});
}

class ForecastWeather {
  String? main;
  String? icon;
  String? dtText;
  double? temp;

  ForecastWeather({
    this.dtText,
    this.icon,
    this.main,
    this.temp,
  });
}
