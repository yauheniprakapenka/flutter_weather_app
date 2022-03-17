import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../shared/helpers/has_internet.dart';

part 'today_weather_event.dart';
part 'today_weather_state.dart';

class TodayWeatherBloc extends Bloc<TodayWeatherEvent, TodayWeatherState> {
  final _getCurrentLocationUseCase = GetCurrentLocationUseCase(Get.find<ILocationRepository>());

  TodayWeatherBloc() : super(const TodayWeatherState(weather: Weather())) {
    on<GetTodayWeatherEvent>(_onGetTodayWeather);
  }

  Future<void> _onGetTodayWeather(GetTodayWeatherEvent _, Emitter<TodayWeatherState> emit) async {
    if (!await hasInternet()) return emit(_getNoInternetState());

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

  TodayWeatherState _getNoInternetState() {
    return state.copyWith(error: 'No internet', isLoading: false);
  }

  TodayWeatherState _getLoadingState() {
    return state.copyWith(isLoading: true, error: '');
  }
}
