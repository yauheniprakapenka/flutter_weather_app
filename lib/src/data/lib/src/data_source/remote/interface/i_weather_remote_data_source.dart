import 'package:flutter_weather_app/src/domain/lib/domain.dart';

abstract class IWeatherRemoteDataSource {
  Future<Weather> getCurrentLocationWeather(Coordinates coordinates);
}
