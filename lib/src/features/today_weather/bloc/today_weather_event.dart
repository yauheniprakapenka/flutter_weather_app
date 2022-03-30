part of 'today_weather_bloc.dart';

abstract class TodayWeatherEvent {}

class GetTodayWeatherEvent implements TodayWeatherEvent {}

class RefreshTodayWeatherEvent implements TodayWeatherEvent {}
