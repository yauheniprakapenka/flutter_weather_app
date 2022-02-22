import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import '../dto/weather_dto.dart';

class WeatherAdapter {
  static Weather mapDtoToEntity(WeatherDto weatherDto) {
    return Weather(
      city: weatherDto.name,
      codeCountry: weatherDto.sys?.country,
      humidity: weatherDto.main?.humidity,
      pressure: weatherDto.main?.pressure,
      rainVolume: weatherDto.rain?.oneHour,
      temperature: weatherDto.main?.temp,
      weather: weatherDto.weather?.first.main,
      windDegrees: weatherDto.wind?.deg,
      windSpeed: weatherDto.wind?.speed,
      icon: weatherDto.weather?.first.icon,
    );
  }
}
