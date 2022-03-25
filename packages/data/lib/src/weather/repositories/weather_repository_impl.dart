import 'package:domain/domain.dart';

import '../datasource/i_weather_local_data_source.dart';
import '../datasource/i_weather_remote_data_source.dart';
import '../mapper/forecast_mapper.dart';
import '../mapper/weather_mapper.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final IWeatherLocalDataSource _localDataSource;
  final IWeatherRemoteDataSource _remoteDataSource;

  const WeatherRepositoryImpl({
    required IWeatherLocalDataSource localDataSource,
    required IWeatherRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, Weather>> getTodayWeather(Coordinates coordinates) async {
    var localWeatherDto = await _localDataSource.getTodayWeather();
    if (localWeatherDto == null) {
      try {
        final remoteWeatherDto = await _remoteDataSource.getTodayWeather(coordinates);
        await _localDataSource.saveTodayWeather(remoteWeatherDto);
        localWeatherDto = await _localDataSource.getTodayWeather();
      } on Exception catch (e) {
        return Left(Failure('$e'));
      }
    }
    return localWeatherDto == null
        ? const Left(Failure('Today weather is null'))
        : Right(mapWeatherDtoToEntity(localWeatherDto));
  }

  @override
  Future<Either<Failure, Weather>> refreshTodayWeather(Coordinates coordinates) async {
    try {
      final remoteWeatherDto = await _remoteDataSource.getTodayWeather(coordinates);
      await _localDataSource.saveTodayWeather(remoteWeatherDto);
    } on Exception catch (e) {
      return Left(Failure('$e'));
    }
    final localWeatherDto = await _localDataSource.getTodayWeather();
    return localWeatherDto == null
        ? const Left(Failure('Today weather is null'))
        : Right(mapWeatherDtoToEntity(localWeatherDto));
  }

  @override
  Future<Either<Failure, Forecast>> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    var localForecastDto = await _localDataSource.getFiveDaysWeatherForecast();
    if (localForecastDto == null) {
      try {
        final remoteForecastDto = await _remoteDataSource.getFiveDaysWeatherForecast(coordinates);
        await _localDataSource.saveFiveDaysWeatherForecast(remoteForecastDto);
        localForecastDto = await _localDataSource.getFiveDaysWeatherForecast();
      } on Exception catch (e) {
        return Left(Failure('$e'));
      }
    }
    return localForecastDto == null
        ? const Left(Failure('Forecast weathet is null'))
        : Right(mapForecastDtoToEntity(localForecastDto));
  }

  @override
  Future<Either<Failure, Forecast>> refreshFiveDaysWeatherForecast(Coordinates coordinates) async {
    try {
      final remoteForecastrDto = await _remoteDataSource.getFiveDaysWeatherForecast(coordinates);
      await _localDataSource.saveFiveDaysWeatherForecast(remoteForecastrDto);
    } on Exception catch (e) {
      return Left(Failure('$e'));
    }
    final localForecastrDto = await _localDataSource.getFiveDaysWeatherForecast();
    return localForecastrDto == null
        ? const Left(Failure('Today weather is null'))
        : Right(mapForecastDtoToEntity(localForecastrDto));
  }
}
