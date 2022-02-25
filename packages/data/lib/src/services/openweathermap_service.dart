import 'package:domain/domain.dart';

import '../api/dio/dio_http_client.dart';
import '../dto/dto.dart';

class OpenweathermapService {
  final _client = dioHttpClient('https://api.openweathermap.org/data/2.5/');

  /// Secret api key
  static const _apiKey = 'aae36a3b16c74e4080309f1686872f92';

  Future<WeatherDto> getCurrentWeather(Coordinates coordinates) async {
    final path = 'weather?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$_apiKey';
    final response = await _client.get(path);
    return WeatherDto.fromJson(response.data);
  }

  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    final path = 'forecast?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$_apiKey';
    final response = await _client.get(path);
    return ForecastDto.fromJson(response.data);
  }
}