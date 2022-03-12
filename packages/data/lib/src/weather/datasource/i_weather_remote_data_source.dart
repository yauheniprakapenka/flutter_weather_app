import 'package:domain/domain.dart';

import '../dto/forecast_dto.dart';
import '../dto/weather_dto.dart';

abstract class IWeatherRemoteDataSource {
  Future<WeatherDto> getTodayWeather(Coordinates coordinates);

  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates);
}
