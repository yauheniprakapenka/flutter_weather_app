import 'package:flutter_weather_app/src/data/lib/src/data_source/remote/interface/i_weather_remote_data_source.dart';
import 'package:flutter_weather_app/src/domain/lib/src/entities/coordinates.dart';
import 'package:flutter_weather_app/src/domain/lib/src/entities/weather.dart';

class WeatherMockRemoteDataSource implements IWeatherRemoteDataSource {
  @override
  Future<Weather> getCurrentLocationWeather(Coordinates coordinates) async {
    await Future.delayed(const Duration(seconds: 1));
    return const Weather(
      temperature: 2,
      weather: 'Clouds',
      city: 'Gomel',
      codeCountry: 'BY',
      windSpeed: 7,
      humidity: 40,
      windDegrees: 200,
      pressure: 1010,
      rainVolume: 3.0,
    );
  }
}
