
import '../entities/entities.dart';
import '../repositories/i_weather_repository.dart';

class GetCurrenLocationWeatherUseCase {
  final IWeatherRepository _weatherRepository;

  const GetCurrenLocationWeatherUseCase({required IWeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository;

  Future<Weather> call(Coordinates coordinates) async {
    return _weatherRepository.getCurrentLocationWeather(coordinates);
  }
}
