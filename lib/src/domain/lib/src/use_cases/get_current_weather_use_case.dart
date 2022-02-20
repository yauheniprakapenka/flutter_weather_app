import '../entities/entities.dart';
import '../repositories/i_weather_repository.dart';

class GetCurrentWeatherUseCase {
  final IWeatherRepository _weatherRepository;

  const GetCurrentWeatherUseCase({required IWeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  Future<Weather> call(Coordinates coordinates) async {
    return _weatherRepository.getCurrentLocationWeather(coordinates);
  }
}
