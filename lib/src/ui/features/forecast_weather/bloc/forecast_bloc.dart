import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../shared/providers/connectivity_provider.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final _getCurrentLocationUseCase = GetCurrentLocationUseCase(Get.find<ILocationRepository>());

  ForecastBloc() : super(const ForecastState(forecast: Forecast())) {
    on<GetFiveDaysWeatherForecastEvent>(_onGetFiveDaysWeatherForecastEvent);
  }

  Future<void> _onGetFiveDaysWeatherForecastEvent(
      GetFiveDaysWeatherForecastEvent _, Emitter<ForecastState> emit) async {
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

  ForecastState _getNoInternetState() {
    return state.copyWith(error: 'No internet', isLoading: false);
  }

  ForecastState _getLoadingState() {
    return state.copyWith(isLoading: true, error: '');
  }

  Future<bool> _hasInternet() async {
    return ConnectivityProvider.call();
  }
}