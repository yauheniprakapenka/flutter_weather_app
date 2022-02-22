import 'package:flutter_weather_app/src/data/lib/src/dto/forecast_dto.dart';
import 'package:flutter_weather_app/src/data/lib/src/services/location_service.dart';
import 'package:flutter_weather_app/src/domain/lib/src/entities/coordinates.dart';

import '../../../dto/weather_dto.dart';
import '../../../services/openweathermap_service.dart';
import '../interface/i_weather_remote_data_source.dart';

class OpenWeatherMapRemoteDataSourceImpl implements IWeatherRemoteDataSource {
  final  _locationService = LocationService();
  /// Get all your essential weather data for a specific location.
  ///
  /// https://openweathermap.org/api/one-call-api
  @override
  Future<WeatherDto> getTodayWeather(Coordinates coordinates) async {
    return OpenweathermapService().getCurrentWeather(coordinates);
  }

  /// 5 day forecast is available at any location on the globe. It includes
  /// weather forecast data with 3-hour step.
  ///
  /// https://openweathermap.org/forecast5
  @override
  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    // final _coordinates = await _locationService.getCoordinates();
    return OpenweathermapService().getFiveDaysWeatherForecast(coordinates);
  }
}
