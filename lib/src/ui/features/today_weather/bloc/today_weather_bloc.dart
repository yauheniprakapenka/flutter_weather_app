import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../app/utils/has_internet.dart';

part 'today_weather_event.dart';
part 'today_weather_state.dart';

class TodayWeatherBloc extends Bloc<TodayWeatherEvent, TodayWeatherState> {
  final _getCurrentLocationUseCase = GetCurrentLocationUseCase(Get.find<ILocationRepository>());

  TodayWeatherBloc() : super(const TodayWeatherState(weather: Weather())) {
    on<GetTodayWeatherEvent>(_onGetTodayWeather);
    on<RefreshTodayWeatherEvent>(_onRefreshTodayWeatherEvent);
  }

  Future<void> _onRefreshTodayWeatherEvent(RefreshTodayWeatherEvent _, Emitter<TodayWeatherState> emit) async {
    if (await hasInternet()) return emit(_getNoInternetState());
    emit(_getLoadingState());
    final coordinates = await _getCurrentLocationUseCase();
    await coordinates.fold(
      (failure) async {
        emit(state.copyWith(errorMessage: failure.message, isLoading: false));
      },
      (coordinates) async {
        final weather = await RefreshTodayWeatherUseCase(weatherRepository: Get.find()).call(coordinates);
        weather.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
          (weather) => emit(state.copyWith(weather: weather, isLoading: false)),
        );
      },
    );
  }

  Future<void> _onGetTodayWeather(GetTodayWeatherEvent _, Emitter<TodayWeatherState> emit) async {
    if (!await hasInternet()) return emit(_getNoInternetState());
    emit(_getLoadingState());
    final coordinates = await _getCurrentLocationUseCase();
    await coordinates.fold(
      (failure) async => emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
      (coordinates) async {
        final weather = await GetTodayWeatherUseCase(weatherRepository: Get.find()).call(coordinates);
        weather.fold(
          (failure) => emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
          (weather) => emit(state.copyWith(weather: weather, isLoading: false)),
        );
      },
    );
  }

  TodayWeatherState _getNoInternetState() {
    return state.copyWith(errorMessage: 'No internet', isLoading: false);
  }

  TodayWeatherState _getLoadingState() {
    return state.copyWith(isLoading: true, errorMessage: '');
  }
}
