import 'package:domain/domain.dart';

import '../../../../dto/dto.dart';
import '../../../../services/openweathermap_service.dart';
import '../interface/i_weather_remote_data_source.dart';

class OpenWeatherMapRemoteDataSourceImpl implements IWeatherRemoteDataSource {
  /// Get all your essential weather data for a specific location.
  ///
  /// https://openweathermap.org/api/one-call-api
  @override
  Future<WeatherDto> getTodayWeather(Coordinates coordinates) async {
    return OpenweathermapService().getCurrentWeather(coordinates);
  }

  /// 5 day forecast is available at any location on the globe. It includes
  /// weather forecast data with 3-hour step.
  ///
  /// https://openweathermap.org/forecast5
  @override
  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    return OpenweathermapService().getFiveDaysWeatherForecast(coordinates);
  }
}
