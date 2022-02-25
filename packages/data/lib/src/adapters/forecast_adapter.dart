import 'package:domain/domain.dart';

import '../dto/dto.dart';

class ForecastAdapter {
  static Forecast mapDtoToEntity(ForecastDto forecastDto) {
    final forecastWeather = forecastDto.list?.map((e) {
      return ForecastWeather(
        dtText: e.dtText,
        icon: e.weatherDto?.icon,
        temp: e.main?.temp,
        main: e.weatherDto?.main,
      );
    }).toList();
    return Forecast(
      weather: forecastWeather,
      city: forecastDto.city?.city,
    );
  }
}
