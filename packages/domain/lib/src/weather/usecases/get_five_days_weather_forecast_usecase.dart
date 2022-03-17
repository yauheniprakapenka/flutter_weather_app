import 'package:dartz/dartz.dart';

import '../../entities/failure.dart';
import '../../location/entities/coordinates.dart';
import '../entities/forecast.dart';
import '../repositories/i_weather_repository.dart';

class GetFiveDaysWeatherForecastUseCase {
  final IWeatherRepository _weatherRepository;

  const GetFiveDaysWeatherForecastUseCase({required IWeatherRepository weatherRepository}) 
      : _weatherRepository = weatherRepository;

  Future<Either<Failure, Forecast>> call(Coordinates coordinates) async {
    return _weatherRepository.getFiveDaysWeatherForecast(coordinates);
  }
}
