import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../shared/const/app_symbols.dart';
import '../../../shared/extensions/extensions.dart';

class ShareButton extends StatelessWidget {
  final Weather weather;

  const ShareButton({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(context) {
    return TextButton(
      onPressed: () async {
        final shareTextUseCase = ShareTextUseCase();
        await shareTextUseCase(_createWeatherReport());
      },
      child: const Text('Share'),
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
