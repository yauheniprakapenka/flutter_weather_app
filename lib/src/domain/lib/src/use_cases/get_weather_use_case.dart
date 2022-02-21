import '../entities/entities.dart';
import '../repositories/i_weather_repository.dart';

class GetWeatherUseCase {
  final IWeatherRepository _weatherRepository;

  const GetWeatherUseCase({required IWeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  Future<Weather> call(Coordinates coordinates) async {
    return _weatherRepository.getWeather(coordinates);
  }
}
