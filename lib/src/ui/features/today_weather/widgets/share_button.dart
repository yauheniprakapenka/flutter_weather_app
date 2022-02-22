import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import '../../../extensions/extensions.dart';
import '../../../shared/const/app_symbols.dart';

class ShareButton extends StatelessWidget {
  final Weather weather;

  const ShareButton({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(context) {
    return TextButton(
      onPressed: () async {
        await ShareTextUseCase().call(_createWeatherReport());
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
