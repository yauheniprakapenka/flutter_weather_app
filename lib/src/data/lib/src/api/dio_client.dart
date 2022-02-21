import 'package:dio/dio.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';

import '../dto/weather_dto.dart';
import 'logging_interceptor.dart';

class DioClient {
  /// Secret key
  static const _apiKey = 'aae36a3b16c74e4080309f1686872f92'; 

  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      connectTimeout: 15000,
      receiveTimeout: 15000,
    ),
  )..interceptors.add(LoggingInterceptor());

  /// Access current weather data for any location.
  Future<WeatherDto> getCurrentWeather(Coordinates coordinates) async {
    final path = 'weather?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$_apiKey';
    final response = await _dio.get(path);
    return WeatherDto.fromJson(response.data);
  }

  
}
