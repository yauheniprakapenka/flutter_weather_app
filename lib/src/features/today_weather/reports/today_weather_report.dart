import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../app/shared/extensions/kelvin_to_celsius_extension.dart';
import '../../../app/shared/localization/locale_provider.dart';
import '../../../features/today_weather/extensions/wind_direction_extension.dart';

String createTodayWeatherReport(BuildContext context, Weather weather) {
  return '''
Flutter Weather App

city: ${weather.city}, ${weather.codeCountry ?? '-'}
temperature: ${weather.temperature?.convertKelvinToCelsius() ?? '-'} ${context.l10n?.temperatureSymbolCelsius}
weather: ${weather.weather ?? '-'}
wind speed: ${weather.windSpeed ?? '-'}, meter/sec
humidity: ${weather.humidity ?? '-'}, %
wind degrees: ${weather.windDegrees?.getWindDirectionTitle() ?? '-'}
pressure: ${weather.pressure ?? '-'}, , hPa
rain: ${weather.rainVolume ?? '-'}, mm  
''';
}
