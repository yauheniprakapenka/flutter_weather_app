import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../../app/shared/extensions/kelvin_to_celsius_extension.dart';
import '../extensions/week_day_extension.dart';
import '../filters/forecast_day_filter.dart';
import '../models/forecast_weather_list_with_title.dart';
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
                WeatherDay(
                  dayTitle: forecastWeatherListWithTitle.numberDayOfWeek.getWeekDayTitle(context),
                ),
                ...forecastWeatherListWithTitle.forecastWeather.map(
                  (forecastWeather) {
                    return WeatherCard(
                      icon: forecastWeather.icon,
                      hasActiveBorder: _hasWeatherCardActiveBorder(
                        firstForecast: _forecastWeatherListWithTitle.first.forecastWeather.first.dtText ?? '',
                        currentDtText: forecastWeather.dtText ?? '',
                      ),
                      hasBottomBorder: _hasBottomBorder(
                        forecast: _forecastWeatherListWithTitle,
                        currentDtText: forecastWeather.dtText ?? '',
                      ),
                      celsius: forecastWeather.temp?.convertKelvinToCelsius(),
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

  bool _hasBottomBorder({
    required List<ForecastWeatherListWithTitle> forecast,
    required String currentDtText,
  }) {
    final activeText = <String>{};
    for (final element in forecast) {
      for (var i = 0; i < element.forecastWeather.length; i++) {
        if (i == element.forecastWeather.length - 1) {
          activeText.add(element.forecastWeather.last.dtText ?? '');
        }
      }
    }
    return !activeText.contains(currentDtText);
  }
}
