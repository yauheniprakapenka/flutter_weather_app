import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/src/data/lib/data.dart';
import 'package:flutter_weather_app/src/domain/lib/src/providers/weather_provider/events/get_five_days_weather_forecast_event.dart';
import 'package:flutter_weather_app/src/domain/lib/src/use_cases/get_five_days_weather_forecast_use_case.dart';
import 'package:get/get.dart';

import '../../../domain.dart';

class WeatherBloc extends Bloc<IWeatherEvent, WeatherState> {
  final coordinates = Coordinates(latitude: 52.450810664881956, longitude: 31.02244347957928);

  WeatherBloc() : super(const WeatherState(weather: Weather(), forecast: Forecast())) {
    DataServiceLocator.init();
    on<GetTodayWeatherEvent>(_onGetTodayWeather);
    on<GetFiveDaysWeatherForecastEvent>(_onGetFiveDaysWeatherForecastEvent);
  }

  Future<void> _onGetTodayWeather(GetTodayWeatherEvent _, Emitter<WeatherState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));
    final getCurrentWeatherUseCase = GetTodayWeatherUseCase(weatherRepository: Get.find());
    try {
      final weather = await getCurrentWeatherUseCase(coordinates);
      emit(state.copyWith(weather: weather));
    } on DioError catch (e) {
      emit(state.copyWith(error: e.response?.data['message']));
    } on Exception catch (e) {
      emit(state.copyWith(error: 'Error get weather: $e'));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onGetFiveDaysWeatherForecastEvent(GetFiveDaysWeatherForecastEvent _, Emitter<WeatherState> emit) async {
    emit(state.copyWith(isLoading: true, error: ''));
    final getFiveDaysWeatherForecastUseCase = GetFiveDaysWeatherForecastUseCase(weatherRepository: Get.find());
    try {
      final forecast = await getFiveDaysWeatherForecastUseCase(coordinates);
      emit(state.copyWith(forecast: forecast));
    } on DioError catch (e) {
      emit(state.copyWith(error: e.response?.data['message']));
    } on Exception catch (e) {
      emit(state.copyWith(error: 'Error get weather: $e'));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
