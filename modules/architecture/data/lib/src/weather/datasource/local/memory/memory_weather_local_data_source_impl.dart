import 'dart:async';

import '../../../dto/forecast_dto.dart';
import '../../../dto/weather_dto.dart';
import '../i_weather_local_data_source.dart';

class MemoryWeatherLocalDataSourceImpl implements IWeatherLocalDataSource {
  WeatherDto? _weather;
  ForecastDto? _forecast;

  @override
  Future<WeatherDto?> getTodayWeather() async {
    return Future.value(_weather);
  }

  @override
  Future<ForecastDto?> getFiveDaysWeatherForecast() async {
    return Future.value(_forecast);
  }

  @override
  Future<void> saveTodayWeather(WeatherDto weatherDto) async {
    _weather = weatherDto;
  }

  @override
  Future<void> saveFiveDaysWeatherForecast(ForecastDto forecastDto) async {
    _forecast = forecastDto;
  }
}
