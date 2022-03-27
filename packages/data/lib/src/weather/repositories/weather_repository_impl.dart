import 'package:domain/domain.dart';

import '../../utils/api_error_handler.dart';
import '../datasource/local/i_weather_local_data_source.dart';
import '../datasource/remote/i_weather_remote_data_source.dart';
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
        localWeatherDto = remoteWeatherDto;
      } on Exception catch (e) {
        return Left(handleApirError(e));
      }
    }
    return Right(mapWeatherDtoToEntity(localWeatherDto));
  }

  @override
  Future<Either<Failure, Weather>> refreshTodayWeather(Coordinates coordinates) async {
    var localWeatherDto = await _localDataSource.getTodayWeather();
    try {
      final remoteWeatherDto = await _remoteDataSource.getTodayWeather(coordinates);
      await _localDataSource.saveTodayWeather(remoteWeatherDto);
      localWeatherDto = remoteWeatherDto;
    } on Exception catch (e) {
      return Left(handleApirError(e));
    }
    return Right(mapWeatherDtoToEntity(localWeatherDto));
  }

  @override
  Future<Either<Failure, Forecast>> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    var localForecastDto = await _localDataSource.getFiveDaysWeatherForecast();
    if (localForecastDto == null) {
      try {
        final remoteForecastDto = await _remoteDataSource.getFiveDaysWeatherForecast(coordinates);
        await _localDataSource.saveFiveDaysWeatherForecast(remoteForecastDto);
        localForecastDto = remoteForecastDto;
      } on Exception catch (e) {
        return Left(handleApirError(e));
      }
    }
    return Right(mapForecastDtoToEntity(localForecastDto));
  }

  @override
  Future<Either<Failure, Forecast>> refreshFiveDaysWeatherForecast(Coordinates coordinates) async {
    var localForecastrDto = await _localDataSource.getFiveDaysWeatherForecast();
    try {
      final remoteForecastrDto = await _remoteDataSource.getFiveDaysWeatherForecast(coordinates);
      await _localDataSource.saveFiveDaysWeatherForecast(remoteForecastrDto);
      localForecastrDto = remoteForecastrDto;
    } on Exception catch (e) {
      return Left(Failure(message: '$e'));
    }
    return Right(mapForecastDtoToEntity(localForecastrDto));
  }
}
