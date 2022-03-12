import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

import '../adapters/forecast_adapter.dart';
import '../datasource/i_weather_remote_data_source.dart';
import '../mapper/weather_mapper.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final IWeatherRemoteDataSource _remoteDataSource;

  const WeatherRepositoryImpl({required IWeatherRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, Weather>> getTodayWeather(Coordinates coordinates) async {
    try {
      final weatherDto = await _remoteDataSource.getTodayWeather(coordinates);
      final weather = mapWeatherDtoToEntity(weatherDto);
      return Right(weather);
    } on Exception catch (e) {
      if (e is DioError) {
        final Map<String, dynamic> response = e.response?.data;
        final String? data = response['message'];
        return Left(Failure(data ?? 'Error get today weather'));
      }
      return const Left(Failure('Error get today weather'));
    }
  }

  @override
  Future<Either<Failure, Forecast>> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    try {
      final forecastDto = await _remoteDataSource.getFiveDaysWeatherForecast(coordinates);
      final forecast = ForecastAdapter.mapDtoToEntity(forecastDto);
      return Right(forecast);
    } on Exception catch (e) {
      if (e is DioError) {
        final Map<String, dynamic> response = e.response?.data;
        final String? data = response['message'];
        return Left(Failure(data ?? 'Error get five days weather forecast'));
      }
      return const Left(Failure('Error get five days weather forecast'));
    }
  }
}
