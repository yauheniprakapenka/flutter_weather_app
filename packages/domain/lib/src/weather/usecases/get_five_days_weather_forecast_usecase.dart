import '../../location/entities/coordinates.dart';
import '../entities/forecast.dart';
import '../repositories/i_weather_repository.dart';

class GetFiveDaysWeatherForecastUseCase {
  final IWeatherRepository _weatherRepository;

  const GetFiveDaysWeatherForecastUseCase(this._weatherRepository);

  Future<Forecast> call(Coordinates coordinates) async {
    return _weatherRepository.getFiveDaysWeatherForecast(coordinates);
  }
}
