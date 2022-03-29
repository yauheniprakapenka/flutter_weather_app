import 'package:domain/domain.dart';
import 'package:ui/ui.dart';

import '../../../features/today_weather/extensions/wind_direction_extension.dart';
import '../../../shared/extensions/kelvin_to_celsius_extension.dart';

String createTodayWeatherReport(Weather weather) {
  return '''
Flutter Weather App

city: ${weather.city}, ${weather.codeCountry ?? '-'}
temperature: ${weather.temperature?.convertKelvinToCelsium() ?? '-'} ${AppSymbols.celsium}
weather: ${weather.weather ?? '-'}
wind speed: ${weather.windSpeed ?? '-'}, meter/sec
humidity: ${weather.humidity ?? '-'}, %
wind degrees: ${weather.windDegrees?.getWindDirectionTitle() ?? '-'}
pressure: ${weather.pressure ?? '-'}, , hPa
rain: ${weather.rainVolume ?? '-'}, mm  
''';
}
