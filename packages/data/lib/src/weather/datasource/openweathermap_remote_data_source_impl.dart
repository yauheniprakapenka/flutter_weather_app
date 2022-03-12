import 'package:domain/domain.dart';

import '../../api/dio/dio_http_client.dart';
import '../../weather/datasource/i_weather_remote_data_source.dart';
import '../../weather/dto/forecast_dto.dart';
import '../../weather/dto/weather_dto.dart';

class OpenweathermapRemoteDataSourceImpl implements IWeatherRemoteDataSource {
  final _client = dioHttpClient('https://api.openweathermap.org/data/2.5/');

  /// Secret api key.
  static const _apiKey = 'cc95d932d5a45d33a9527d5019475f2c'; // Чужой ключ, найденный в интернете.

  /// Get all your essential weather data for a specific location.
  ///
  /// https://openweathermap.org/api/one-call-api
  @override
  Future<WeatherDto> getTodayWeather(Coordinates coordinates) async {
    try {
      final path = 'weather?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$_apiKey';
      final response = await _client.get(path);
      return WeatherDto.fromJson(response.data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// 5 day forecast is available at any location on the globe. It includes
  /// weather forecast data with 3-hour step.
  ///
  /// https://openweathermap.org/forecast5
  @override
  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    try {
      final path = 'forecast?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$_apiKey';
      final response = await _client.get(path);
      return ForecastDto.fromJson(response.data);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
