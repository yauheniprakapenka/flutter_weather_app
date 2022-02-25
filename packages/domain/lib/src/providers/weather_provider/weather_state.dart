import '../../entities/entities.dart';

class WeatherState {
  final bool isLoading;
  final Weather weather;
  final Forecast forecast;
  final String error;

  const WeatherState({
    this.isLoading = true,
    required this.weather,
    required this.forecast,
    this.error = '',
  });

  WeatherState copyWith({
    bool? isLoading,
    Weather? weather,
    Forecast? forecast,
    String? error,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      forecast: forecast ?? this.forecast,
      error: error ?? this.error,
    );
  }
}
