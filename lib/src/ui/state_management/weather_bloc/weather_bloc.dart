import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'weather_state_management.dart';

class WeatherBloc extends Bloc<IWeatherEvent, WeatherState> {
  var _coordinates = Coordinates(latitude: 0, longitude: 0);
  final _getCurrentLocationUseCase = GetCurrentLocationUseCase(Get.find<ILocationRepository>());

  WeatherBloc() : super(const WeatherState(weather: Weather(), forecast: Forecast())) {
    on<GetTodayWeatherEvent>(_onGetTodayWeather);
    on<GetFiveDaysWeatherForecastEvent>(_onGetFiveDaysWeatherForecastEvent);
  }

  Future<void> _onGetTodayWeather(GetTodayWeatherEvent _, Emitter<WeatherState> emit) async {
    emit(_getLoadingState());
    final getCurrentWeatherUseCase = GetTodayWeatherUseCase(weatherRepository: Get.find());

    try {
      _coordinates = await _getCurrentLocationUseCase();
    } on GeoLocatorError catch (e) {
      return emit(state.copyWith(isLoading: false, error: e.message));
    }

    final hasInternet = await HasInternetUseCase.call();
    if (!hasInternet) {
      return emit(_getNoInternetState());
    }

    try {
      final weather = await getCurrentWeatherUseCase(_coordinates);
      emit(state.copyWith(weather: weather));
    } on DioError catch (e) {
      emit(_getResponseError(e));
    } on Exception catch (e) {
      emit(_getWeatherError(e));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onGetFiveDaysWeatherForecastEvent(GetFiveDaysWeatherForecastEvent _, Emitter<WeatherState> emit) async {
    emit(_getLoadingState());
    final getFiveDaysWeatherForecastUseCase = GetFiveDaysWeatherForecastUseCase(Get.find());

    try {
      _coordinates = await _getCurrentLocationUseCase();
    } on GeoLocatorError catch (e) {
      emit(state.copyWith(isLoading: false, error: e.message));
    }

    final hasInternet = await HasInternetUseCase.call();
    if (!hasInternet) {
      return emit(_getNoInternetState());
    }

    try {
      final forecast = await getFiveDaysWeatherForecastUseCase(_coordinates);
      emit(state.copyWith(forecast: forecast));
    } on DioError catch (e) {
      emit(_getResponseError(e));
    } on Exception catch (e) {
      emit(_getWeatherError(e));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  WeatherState _getNoInternetState() {
    return state.copyWith(error: 'No internet', isLoading: false);
  }

  WeatherState _getLoadingState() {
    return state.copyWith(isLoading: true, error: '');
  }

  WeatherState _getResponseError(DioError e) {
    return state.copyWith(error: e.response?.data['message']);
  }

  WeatherState _getWeatherError(Exception e) {
    return state.copyWith(error: 'Error get weather: $e');
  }
}
