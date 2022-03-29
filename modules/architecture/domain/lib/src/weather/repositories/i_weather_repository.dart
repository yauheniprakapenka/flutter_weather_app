import 'package:dartz/dartz.dart';

import '../../entities/failure.dart';
import '../../location/entities/coordinates.dart';
import '../entities/forecast.dart';
import '../entities/weather.dart';

abstract class IWeatherRepository {
  /// Получить данные из кэша. Если в кэше нет, то запрашиваются данные из сети
  /// и сохраняются в кэш.
  Future<Either<Failure, Weather>> getTodayWeather(Coordinates coordinates);

  /// Получить данные из сети и сохранить в кэш.
  Future<Either<Failure, Weather>> refreshTodayWeather(Coordinates coordinates);

  Future<Either<Failure, Forecast>> getFiveDaysWeatherForecast(Coordinates coordinates);

  Future<Either<Failure, Forecast>> refreshFiveDaysWeatherForecast(Coordinates coordinates);
}
