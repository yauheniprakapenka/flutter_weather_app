import 'package:flutter/material.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';

import '../../../extensions/kelvin_to_celsius_extension.dart';
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
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: WeatherDay(dayTitle: forecastWeatherListWithTitle.dayTitle),
                ),
                ...forecastWeatherListWithTitle.forecastWeather.map(
                  (forecastWeather) {
                    return WeatherCard(
                      isActive: _isWeatherCardActive(
                        firstForecast: _forecastWeatherListWithTitle.first.forecastWeather.first.dtText ?? '',
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

  bool _isWeatherCardActive({required String firstForecast, required String currentDtText}) {
    return firstForecast == currentDtText;
  }
}
