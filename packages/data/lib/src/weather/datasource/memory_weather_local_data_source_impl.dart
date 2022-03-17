import 'dart:async';

import '../dto/forecast_dto.dart';
import '../dto/weather_dto.dart';
import 'i_weather_local_data_source.dart';

class MemoryWeatherLocalDataSourceImpl implements IWeatherLocalDataSource {
  WeatherDto? weather;
  ForecastDto? forecast;

  @override
  Future<WeatherDto?> getTodayWeather() async {
    return Future.value(weather);
  }

  @override
  Future<ForecastDto?> getFiveDaysWeatherForecast() async {
    return Future.value(forecast);
  }

  @override
  Future<void> saveTodayWeather(WeatherDto weatherDto) async {
    weather = weatherDto;
  }

  @override
  Future<void> saveFiveDaysWeatherForecast(ForecastDto forecastDto) async {
    forecast = forecastDto;
  }
}
