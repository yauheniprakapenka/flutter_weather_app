import '../entities/entities.dart';

abstract class IWeatherRepository {
  Future<Weather> getCurrentLocationWeather(Coordinates coordinates);
}
