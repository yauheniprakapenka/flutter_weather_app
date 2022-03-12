import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../providers/connectivity_provider.dart';
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

    try {
      _coordinates = await _getCurrentLocationUseCase();
    } on GeoLocatorError catch (e) {
      return emit(state.copyWith(isLoading: false, error: e.message));
    }

    final hasInternet = await ConnectivityProvider.call();
    if (!hasInternet) {
      return emit(_getNoInternetState());
    }

    final weather = await GetTodayWeatherUseCase(weatherRepository: Get.find()).call(_coordinates);
    weather.fold(
      (failure) {
        emit(state.copyWith(error: failure.message));
      },
      (weather) {
        emit(state.copyWith(weather: weather));
      },
    );

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onGetFiveDaysWeatherForecastEvent(GetFiveDaysWeatherForecastEvent _, Emitter<WeatherState> emit) async {
    emit(_getLoadingState());

    try {
      _coordinates = await _getCurrentLocationUseCase();
    } on GeoLocatorError catch (e) {
      emit(state.copyWith(isLoading: false, error: e.message));
    }

    final hasInternet = await ConnectivityProvider.call();
    if (!hasInternet) {
      return emit(_getNoInternetState());
    }

    final forecast = await GetFiveDaysWeatherForecastUseCase(Get.find()).call(_coordinates);
    forecast.fold((failure) {
      emit(state.copyWith(error: failure.message));
    }, (forecast) {
      emit(state.copyWith(forecast: forecast));
    });

    emit(state.copyWith(isLoading: false));
  }

  WeatherState _getNoInternetState() {
    return state.copyWith(error: 'No internet', isLoading: false);
  }

  WeatherState _getLoadingState() {
    return state.copyWith(isLoading: true, error: '');
  }
}
