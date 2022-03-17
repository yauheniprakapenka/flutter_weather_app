import 'package:dartz/dartz.dart';

import '../../entities/failure.dart';
import '../../location/entities/coordinates.dart';
import '../entities/weather.dart';
import '../repositories/i_weather_repository.dart';

class RefreshTodayWeatherUseCase {
  final IWeatherRepository _weatherRepository;

  const RefreshTodayWeatherUseCase({required IWeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  Future<Either<Failure, Weather>> call(Coordinates coordinates) async {
    return _weatherRepository.refreshTodayWeather(coordinates);
  }
}
