import 'package:domain/domain.dart';

import '../../../dto/dto.dart';

abstract class IWeatherRemoteDataSource {
  Future<WeatherDto> getTodayWeather(Coordinates coordinates);

  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates);
}
