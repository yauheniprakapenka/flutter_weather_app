import '../../dto/forecast_dto.dart';
import '../../dto/weather_dto.dart';

abstract class IWeatherLocalDataSource {
  Future<WeatherDto?> getTodayWeather();

  Future<ForecastDto?> getFiveDaysWeatherForecast();

  Future<void> saveTodayWeather(WeatherDto weatherDto);

  Future<void> saveFiveDaysWeatherForecast(ForecastDto forecastDto);
}
