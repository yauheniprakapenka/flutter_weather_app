import 'package:dartz/dartz.dart';

import '../../entities/failure.dart';
import '../../location/entities/coordinates.dart';
import '../entities/weather.dart';
import '../repositories/i_weather_repository.dart';

class GetTodayWeatherUseCase {
  final IWeatherRepository _weatherRepository;

  const GetTodayWeatherUseCase({required IWeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  Future<Either<Failure, Weather>> call(Coordinates coordinates) async {
    return _weatherRepository.getTodayWeather(coordinates);
  }
}
