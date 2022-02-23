import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import '../api/dio/dio_http_client.dart';
import '../dto/dto.dart';

class OpenweathermapService {
  final _client = dioHttpClient('https://api.openweathermap.org/data/2.5/');

  /// Secret key
  static const _apiKey = '';

  /// Access current weather data for any location.
  Future<WeatherDto> getCurrentWeather(Coordinates coordinates) async {
    final path = 'weather?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$_apiKey';
    final response = await _client.get(path);
    return WeatherDto.fromJson(response.data);
  }

  /// Access current weather data for any location.
  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    final path = 'forecast?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$_apiKey';
    final response = await _client.get(path);
    return ForecastDto.fromJson(response.data);
  }
}
