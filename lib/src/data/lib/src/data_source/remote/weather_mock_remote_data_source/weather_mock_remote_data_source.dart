import 'dart:convert';

import 'package:flutter_weather_app/src/data/lib/src/data_source/remote/interface/i_weather_remote_data_source.dart';
import 'package:flutter_weather_app/src/data/lib/src/data_source/remote/weather_mock_remote_data_source/weather_stub_json.dart';
import 'package:flutter_weather_app/src/data/lib/src/dto/weather_dto.dart';
import 'package:flutter_weather_app/src/domain/lib/src/entities/coordinates.dart';

class WeatherMockRemoteDataSource implements IWeatherRemoteDataSource {
  @override
  Future<WeatherDto> getCurrentLocationWeather(Coordinates coordinates) async {
    await Future.delayed(const Duration(seconds: 1));
    final Map<String, dynamic> decodedJson = jsonDecode(weatherStubJson);
    return WeatherDto.fromJson(decodedJson);
  }
}
