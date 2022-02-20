import 'package:flutter_weather_app/src/domain/lib/domain.dart';

class WeatherState {
  final bool isLoading;
  final Weather weather;

  const WeatherState({
    required this.isLoading,
    required this.weather,
  });

  WeatherState copyWith({bool? isLoading, Weather? weather}) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }
}