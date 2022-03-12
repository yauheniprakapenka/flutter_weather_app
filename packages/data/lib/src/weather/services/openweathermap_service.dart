import 'package:domain/domain.dart';

import '../../api/dio/dio_http_client.dart';
import '../dto/forecast_dto.dart';
import '../dto/weather_dto.dart';

class OpenweathermapService {
  final _client = dioHttpClient('https://api.openweathermap.org/data/2.5/');

  /// Secret api key
  static const _apiKey = 'cc95d932d5a45d33a9527d5019475f2c'; 
  
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
