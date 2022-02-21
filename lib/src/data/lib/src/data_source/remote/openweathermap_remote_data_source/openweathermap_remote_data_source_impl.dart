import 'package:flutter_weather_app/src/data/lib/src/dto/forecast_dto.dart';
import 'package:flutter_weather_app/src/domain/lib/src/entities/coordinates.dart';

import '../../../api/dio_client.dart';
import '../../../dto/weather_dto.dart';
import '../interface/i_weather_remote_data_source.dart';

class OpenWeatherMapRemoteDataSourceImpl implements IWeatherRemoteDataSource {
  @override
  Future<WeatherDto> getWeather(Coordinates coordinates) async {
    return DioClient().getCurrentWeather(coordinates);
  }

  @override
  Future<ForecastDto> getFiveDaysWeatherForecast(Coordinates coordinates) {
    throw UnimplementedError();
  }
}
