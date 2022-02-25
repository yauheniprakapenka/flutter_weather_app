import 'dart:convert';

import 'package:domain/domain.dart';

import '../../../dto/dto.dart';
import '../interface/i_weather_remote_data_source.dart';
import 'forecast_stub_json.dart';
import 'weather_stub_json.dart';

class WeatherMockRemoteDataSourceImpl implements IWeatherRemoteDataSource {
  @override
  Future<WeatherDto> getTodayWeather(Coordinates coordinates) async {
    await Future.delayed(const Duration(seconds: 1));
    final Map<String, dynamic> decodedJson = jsonDecode(weatherStubJson);
    return WeatherDto.fromJson(decodedJson);
  }

  @override
  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    await Future.delayed(const Duration(seconds: 1));
    final Map<String, dynamic> decodedJson = jsonDecode(forecastStubJson);
    return ForecastDto.fromJson(decodedJson);
  }
}
