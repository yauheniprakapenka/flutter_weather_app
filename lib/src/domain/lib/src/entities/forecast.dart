class Forecast {
  final List<ForecastWeather>? weather;

  Forecast({this.weather});
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
