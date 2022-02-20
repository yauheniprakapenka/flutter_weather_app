import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/src/data/lib/src/di/data_service_locator.dart';
import 'package:get/get.dart';

import '../../../domain.dart';

class WeatherBloc extends Bloc<IWeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState(isLoading: true, weather: Weather())) {
    DataServiceLocator.init();
    on<GetCurrentLocationWeatherEvent>(_onGetCurrenLocationWeatherUseCase);
  }

  Future<void> _onGetCurrenLocationWeatherUseCase(GetCurrentLocationWeatherEvent _, Emitter<WeatherState> emit) async {
    emit(state.copyWith(isLoading: true));
    final getCurrenLocationWeatherUseCase = GetCurrentLocationWeatherUseCase(
      weatherRepository: Get.find(),
    );
    final coordinates = Coordinates(latitude: 52.450810664881956, longitude: 31.02244347957928);
    final weather = await getCurrenLocationWeatherUseCase(coordinates);
    emit(state.copyWith(isLoading: false, weather: weather));
  }
}
