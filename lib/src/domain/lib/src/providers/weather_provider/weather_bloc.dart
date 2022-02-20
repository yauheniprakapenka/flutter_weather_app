import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/src/data/lib/data.dart';
import 'package:get/get.dart';

import '../../../domain.dart';

class WeatherBloc extends Bloc<IWeatherEvent, WeatherState> {
  WeatherBloc() : super(const WeatherState(isLoading: true, weather: Weather())) {
    DataServiceLocator.init();
    on<GetCurrentWeatherEvent>(_onGetCurrenWeather);
  }

  Future<void> _onGetCurrenWeather(
    GetCurrentWeatherEvent _,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final getCurrentWeatherUseCase = GetCurrentWeatherUseCase(weatherRepository: Get.find());
    final coordinates = Coordinates(latitude: 52.450810664881956, longitude: 31.02244347957928);
    final weather = await getCurrentWeatherUseCase(coordinates);
    emit(state.copyWith(isLoading: false, weather: weather));
  }
}
