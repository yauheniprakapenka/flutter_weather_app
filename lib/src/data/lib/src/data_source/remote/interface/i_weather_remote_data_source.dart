import 'package:flutter_weather_app/src/domain/lib/domain.dart';

import '../../../dto/dto.dart';

abstract class IWeatherRemoteDataSource {
  Future<WeatherDto> getWeather(Coordinates coordinates);

  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates);
}
