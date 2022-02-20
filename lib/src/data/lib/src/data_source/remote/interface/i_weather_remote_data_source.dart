import 'package:flutter_weather_app/src/domain/lib/domain.dart';

import '../../../dto/weather_dto.dart';

abstract class IWeatherRemoteDataSource {
  Future<WeatherDto> getCurrentLocationWeather(Coordinates coordinates);
}
