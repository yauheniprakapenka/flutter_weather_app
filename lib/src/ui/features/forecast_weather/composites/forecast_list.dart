import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';

import '../../../extensions/kelvin_to_celsius_extension.dart';
import '../../../models/forecast_weather_list_with_title.dart';
import '../../../utils/forecast_day_filter.dart';
import '../widgets/widgets.dart';

class ForecastList extends StatelessWidget {
  final Forecast forecast;

  const ForecastList({Key? key, required this.forecast}) : super(key: key);

  @override
  Widget build(context) {
    final _forecastWeatherListWithTitle = ForecastDayFilter().getForecastWeatherListWithTitle(forecast);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ..._forecastWeatherListWithTitle.map(
          (forecastWeatherListWithTitle) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeatherDay(dayTitle: forecastWeatherListWithTitle.dayTitle),
                ...forecastWeatherListWithTitle.forecastWeather.map(
                  (forecastWeather) {
                    return WeatherCard(
                      hasActiveBorder: _hasWeatherCardActiveBorder(
                        firstForecast: _forecastWeatherListWithTitle.first.forecastWeather.first.dtText ?? '',
                        currentDtText: forecastWeather.dtText ?? '',
                      ),
                      hasBottomBorder: _hasBottomBorder(
                        forecast: _forecastWeatherListWithTitle,
                        currentDtText: forecastWeather.dtText ?? '',
                      ),
                      celsium: forecastWeather.temp?.convertKelvinToCelsium(),
                      time: forecastWeather.dtText,
                      description: forecastWeather.main,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  bool _hasWeatherCardActiveBorder({required String firstForecast, required String currentDtText}) {
    return firstForecast == currentDtText;
  }

  bool _hasBottomBorder({required List<ForecastWeatherListWithTitle> forecast, required String currentDtText}) {
    final activeText = <String>{};
    forecast.forEach((element) {
      for (var i = 0; i < element.forecastWeather.length; i++) {
        if (i == element.forecastWeather.length - 1) activeText.add(element.forecastWeather.last.dtText ?? '');
      }
    });
    return !activeText.contains(currentDtText);
  }
}
