import '../../entities/entities.dart';

class WeatherState {
  final bool isLoading;
  final Weather weather;
  final Forecast forecast;

  const WeatherState({
    required this.isLoading,
    required this.weather,
    required this.forecast,
  });

  WeatherState copyWith({
    bool? isLoading,
    Weather? weather,
    Forecast? forecast,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      forecast: forecast ?? this.forecast,
    );
  }
}
