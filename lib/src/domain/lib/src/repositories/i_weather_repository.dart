import '../entities/entities.dart';

abstract class IWeatherRepository {
  Future<Weather> getTodayWeather(Coordinates coordinates);

  Future<Forecast> getFiveDaysWeatherForecast(Coordinates coordinates);
}
