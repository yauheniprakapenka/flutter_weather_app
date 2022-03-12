import 'package:dartz/dartz.dart';

import '../../entities/failure.dart';
import '../../location/entities/coordinates.dart';
import '../entities/forecast.dart';
import '../entities/weather.dart';

abstract class IWeatherRepository {
  Future<Either<Failure, Weather>> getTodayWeather(Coordinates coordinates);

  Future<Either<Failure, Forecast>> getFiveDaysWeatherForecast(Coordinates coordinates);
}
