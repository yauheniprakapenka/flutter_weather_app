import 'package:flutter_weather_app/src/data/lib/src/adapters/forecast_adapter.dart';
import 'package:flutter_weather_app/src/data/lib/src/data_source/remote/interface/i_weather_remote_data_source.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';

import '../adapters/weather_adapter.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final IWeatherRemoteDataSource _remoteDataSource;

  const WeatherRepositoryImpl({required IWeatherRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Weather> getTodayWeather(Coordinates coordinates) async {
    final weatherDto = await _remoteDataSource.getTodayWeather(coordinates);
    return WeatherAdapter.mapDtoToEntity(weatherDto);
  }

  @override
  Future<Forecast> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    final forecastDto = await _remoteDataSource.getFiveDaysWeatherForecast(coordinates);
    return ForecastAdapter.mapDtoToEntity(forecastDto);
  }
}
