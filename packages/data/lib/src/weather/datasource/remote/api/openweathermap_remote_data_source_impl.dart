import 'package:domain/domain.dart';

import '../../../../http_client/dio_client/dio_client.dart';
import '../../../const/api_const.dart';
import '../../../const/api_key.dart';
import '../../../dto/forecast_dto.dart';
import '../../../dto/weather_dto.dart';
import '../i_weather_remote_data_source.dart';

class OpenweathermapRemoteDataSourceImpl implements IWeatherRemoteDataSource {
  final _client = dioClient(ApiConst.baseUrl);

  /// Get all your essential weather data for a specific location.
  ///
  /// https://openweathermap.org/api/one-call-api
  @override
  Future<WeatherDto> getTodayWeather(Coordinates coordinates) async {
    try {
      final path = '${ApiConst.weatherEndpoint}?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$openWeatherApiKey';
      final response = await _client.get(path);
      return WeatherDto.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }

  /// 5 day forecast is available at any location on the globe. It includes
  /// weather forecast data with 3-hour step.
  ///
  /// https://openweathermap.org/forecast5
  @override
  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) async {
    try {
      final path = '${ApiConst.forecastEndpoint}?lat=${coordinates.latitude}&lon=${coordinates.longitude}&appid=$openWeatherApiKey';
      final response = await _client.get(path);
      return ForecastDto.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
