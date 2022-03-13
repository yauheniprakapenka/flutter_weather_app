import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../shared/const/app_symbols.dart';
import '../../../shared/extensions/kelvin_to_celsius_extension.dart';
import '../../../shared/localization/extensions/l10n_extension.dart';
import '../../../shared/providers/weather_report_provider.dart';
import '../extensions/wind_direction_extension.dart';

class ShareButton extends StatelessWidget {
  final Weather weather;

  const ShareButton({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(context) {
    return TextButton(
      onPressed: () async {
        final shareTextUseCase = WeatherReportProvider();
        await shareTextUseCase(_createWeatherReport());
      },
      child: Text(context.l10n?.shareButtonText ?? ''),
    );
  }

  String _createWeatherReport() {
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
}
