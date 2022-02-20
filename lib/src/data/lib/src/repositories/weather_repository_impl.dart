import 'package:flutter_weather_app/src/data/lib/src/data_source/remote/interface/i_weather_remote_data_source.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';

import '../adapters/weather_adapter.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final IWeatherRemoteDataSource _remoteDataSource;

  const WeatherRepositoryImpl({required IWeatherRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Weather> getCurrentLocationWeather(Coordinates coordinates) async {
    final weatherDto = await _remoteDataSource.getCurrentLocationWeather(coordinates);
    return WeatherAdapter.mapDtoToEntity(weatherDto);
  }
}
