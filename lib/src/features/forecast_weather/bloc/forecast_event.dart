part of 'forecast_bloc.dart';

abstract class ForecastEvent {}

class GetFiveDaysWeatherForecastEvent implements ForecastEvent {}

class RefreshGetFiveDaysWeatherForecastEvent implements ForecastEvent {}
