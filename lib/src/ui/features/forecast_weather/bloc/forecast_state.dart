part of 'forecast_bloc.dart';

class ForecastState {
  final bool isLoading;
  final Forecast forecast;
  final String errorMessage;

  const ForecastState({this.isLoading = true, required this.forecast, this.errorMessage = ''});

  ForecastState copyWith({bool? isLoading, Forecast? forecast, String? errorMessage}) {
    return ForecastState(
      isLoading: isLoading ?? this.isLoading,
      forecast: forecast ?? this.forecast,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
