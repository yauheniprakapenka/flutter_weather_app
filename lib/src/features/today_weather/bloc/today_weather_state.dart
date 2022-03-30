part of 'today_weather_bloc.dart';

class TodayWeatherState {
  final bool isLoading;
  final Weather weather;
  final String errorMessage;

  const TodayWeatherState({this.isLoading = true, required this.weather, this.errorMessage = ''});

  TodayWeatherState copyWith({bool? isLoading, Weather? weather, String? errorMessage}) {
    return TodayWeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
