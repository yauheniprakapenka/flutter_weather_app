part of 'today_weather_bloc.dart';

class TodayWeatherState {
  final bool isLoading;
  final Weather weather;
  final String error;

  const TodayWeatherState({
    this.isLoading = true,
    required this.weather,
    this.error = '',
  });

  TodayWeatherState copyWith({
    bool? isLoading,
    Weather? weather,
    String? error,
  }) {
    return TodayWeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }
}
