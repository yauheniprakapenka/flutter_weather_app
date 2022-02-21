import '../entities/entities.dart';
import '../repositories/i_weather_repository.dart';

class GetFiveDaysWeatherForecastUseCase {
  final IWeatherRepository _weatherRepository;

  const GetFiveDaysWeatherForecastUseCase({required IWeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  Future<Forecast> call(Coordinates coordinates) async {
    return _weatherRepository.getFiveDaysWeatherForecast(coordinates);
  }
}
