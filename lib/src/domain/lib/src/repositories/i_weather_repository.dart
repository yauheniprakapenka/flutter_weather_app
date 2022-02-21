import '../entities/entities.dart';

abstract class IWeatherRepository {
  Future<Weather> getWeather(Coordinates coordinates);

  Future<Forecast> getFiveDaysWeatherForecast(Coordinates coordinates);
}
