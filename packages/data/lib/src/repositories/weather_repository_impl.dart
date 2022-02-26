import 'package:domain/domain.dart';

import '../adapters/forecast_adapter.dart';
import '../adapters/weather_adapter.dart';
import '../data_source/remote/openweathermap/interface/i_weather_remote_data_source.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final IWeatherRemoteDataSource _remoteDataSource;

  const WeatherRepositoryImpl(this._remoteDataSource);

  @override
  Future<Weather> getTodayWeather(Coordinates coordinates) async {
    final weatherDto = await _remoteDataSource.getTodayWeather(coordinates);
    return WeatherAdapter.mapDtoToEntity(weatherDto);
  }

  @override
  Future<Forecast> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    final forecastDto = await _remoteDataSource.getFiveDaysWeatherForecast(coordinates);
    return ForecastAdapter.mapDtoToEntity(forecastDto);
  }
}
