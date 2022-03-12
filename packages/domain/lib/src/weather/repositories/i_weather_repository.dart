import '../../location/entities/coordinates.dart';
import '../entities/forecast.dart';
import '../entities/weather.dart';

abstract class IWeatherRepository {
  Future<Weather> getTodayWeather(Coordinates coordinates);

  Future<Forecast> getFiveDaysWeatherForecast(Coordinates coordinates);
}
