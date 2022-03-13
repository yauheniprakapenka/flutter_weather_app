part of 'forecast_bloc.dart';

class ForecastState {
  final bool isLoading;
  final Forecast forecast;
  final String error;

  const ForecastState({
    this.isLoading = true,
    required this.forecast,
    this.error = '',
  });

  ForecastState copyWith({
    bool? isLoading,
    Forecast? forecast,
    String? error,
  }) {
    return ForecastState(
      isLoading: isLoading ?? this.isLoading,
      forecast: forecast ?? this.forecast,
      error: error ?? this.error,
    );
  }
}
