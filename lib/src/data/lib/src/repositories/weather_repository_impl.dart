import 'package:flutter_weather_app/src/data/lib/src/data_source/remote/interface/i_weather_remote_data_source.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final IWeatherRemoteDataSource _remoteDataSource;

  const WeatherRepositoryImpl({required IWeatherRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Weather> getCurrentLocationWeather(Coordinates coordinates) async {
    return _remoteDataSource.getCurrentLocationWeather(coordinates);
  }
}
