import 'package:flutter_weather_app/src/domain/lib/src/entities/coordinates.dart';

import '../../../api/dio_client.dart';
import '../../../dto/weather_dto.dart';
import '../interface/i_weather_remote_data_source.dart';

class OpenWeatherMapRemoteDataSourceImpl implements IWeatherRemoteDataSource {
  @override
  Future<WeatherDto> getCurrentLocationWeather(Coordinates coordinates) async {
    return DioClient().getCurrentWeather(coordinates);
  }
}
