import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../providers/connectivity_provider.dart';
import 'weather.dart';

class WeatherBloc extends Bloc<IWeatherEvents, WeatherState> {
  final _getCurrentLocationUseCase = GetCurrentLocationUseCase(Get.find<ILocationRepository>());

  WeatherBloc() : super(const WeatherState(weather: Weather(), forecast: Forecast())) {
    on<GetTodayWeatherEvent>(_onGetTodayWeather);
    on<GetFiveDaysWeatherForecastEvent>(_onGetFiveDaysWeatherForecastEvent);
  }

  Future<void> _onGetTodayWeather(GetTodayWeatherEvent _, Emitter<WeatherState> emit) async {
    if (!await _hasInternet()) return emit(_getNoInternetState());

    emit(_getLoadingState());

    final coordinates = await _getCurrentLocationUseCase();
    await coordinates.fold(
      (failure) async => emit(state.copyWith(error: failure.message)),
      (coordinates) async {
        final weather = await GetTodayWeatherUseCase(weatherRepository: Get.find()).call(coordinates);
        weather.fold(
          (failure) => emit(state.copyWith(error: failure.message)),
          (weather) => emit(state.copyWith(weather: weather)),
        );
      },
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onGetFiveDaysWeatherForecastEvent(GetFiveDaysWeatherForecastEvent _, Emitter<WeatherState> emit) async {
    if (!await _hasInternet()) return emit(_getNoInternetState());

    emit(_getLoadingState());

    final coordinates = await _getCurrentLocationUseCase();
    await coordinates.fold(
      (failure) async => emit(state.copyWith(error: failure.message)),
      (coordinates) async {
        final forecast = await GetFiveDaysWeatherForecastUseCase(Get.find()).call(coordinates);
        forecast.fold(
          (failure) => emit(state.copyWith(error: failure.message)),
          (forecast) => emit(state.copyWith(forecast: forecast)),
        );
      },
    );
    emit(state.copyWith(isLoading: false));
  }

  WeatherState _getNoInternetState() {
    return state.copyWith(error: 'No internet', isLoading: false);
  }

  WeatherState _getLoadingState() {
    return state.copyWith(isLoading: true, error: '');
  }

  Future<bool> _hasInternet() async {
    return ConnectivityProvider.call();
  }
}
