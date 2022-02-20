
import '../entities/entities.dart';
import '../repositories/i_weather_repository.dart';

class GetCurrentLocationWeatherUseCase {
  final IWeatherRepository _weatherRepository;

  const GetCurrentLocationWeatherUseCase({required IWeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  Future<Weather> call(Coordinates coordinates) async {
    return _weatherRepository.getCurrentLocationWeather(coordinates);
  }
}
