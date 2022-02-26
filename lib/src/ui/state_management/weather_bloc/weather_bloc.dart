import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'weather_state_management.dart';

class WeatherBloc extends Bloc<IWeatherEvent, WeatherState> {
  var _coordinates = Coordinates(latitude: 0, longitude: 0);
  final _locationService = Get.find<ILocationRepository>();

  WeatherBloc() : super(const WeatherState(weather: Weather(), forecast: Forecast())) {
    on<GetTodayWeatherEvent>(_onGetTodayWeather);
    on<GetFiveDaysWeatherForecastEvent>(_onGetFiveDaysWeatherForecastEvent);
  }

  Future<void> _onGetTodayWeather(GetTodayWeatherEvent _, Emitter<WeatherState> emit) async {
    emit(_getLoadingState());
    final getCurrentWeatherUseCase = GetTodayWeatherUseCase(weatherRepository: Get.find());

    try {
      _coordinates = await _locationService.getCurrentLocation();
    } on GeoLocatorError catch (e) {
      return emit(state.copyWith(isLoading: false, error: e.message));
    }

    final hasInternet = await ConnectionManager.hasInternet();
    if (!hasInternet) {
      return emit(_getNoInternetState());
    }

    try {
      final weather = await getCurrentWeatherUseCase(_coordinates);
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
    emit(_getLoadingState());
    final getFiveDaysWeatherForecastUseCase = GetFiveDaysWeatherForecastUseCase(Get.find());

    try {
      _coordinates = await _locationService.getCurrentLocation();
    } on GeoLocatorError catch (e) {
      emit(state.copyWith(isLoading: false, error: e.message));
    }

    final hasInternet = await ConnectionManager.hasInternet();
    if (!hasInternet) {
      return emit(_getNoInternetState());
    }

    try {
      final forecast = await getFiveDaysWeatherForecastUseCase(_coordinates);
      emit(state.copyWith(forecast: forecast));
    } on DioError catch (e) {
      emit(state.copyWith(error: e.response?.data['message']));
    } on Exception catch (e) {
      emit(state.copyWith(error: 'Error get weather: $e'));
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
}
