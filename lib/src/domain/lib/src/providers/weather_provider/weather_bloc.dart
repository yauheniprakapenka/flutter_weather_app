import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/src/data/lib/data.dart';
import 'package:flutter_weather_app/src/domain/lib/src/providers/weather_provider/events/get_five_days_weather_forecast_event.dart';
import 'package:flutter_weather_app/src/domain/lib/src/use_cases/get_five_days_weather_forecast_use_case.dart';
import 'package:get/get.dart';

import '../../../domain.dart';

class WeatherBloc extends Bloc<IWeatherEvent, WeatherState> {
  final coordinates = Coordinates(latitude: 52.450810664881956, longitude: 31.02244347957928);

  WeatherBloc()
      : super(
          const WeatherState(isLoading: true, weather: Weather(), forecast: Forecast()),
        ) {
    DataServiceLocator.init();
    on<GetWeatherEvent>(_onGetCurrenWeather);
    on<GetFiveDaysWeatherForecastEvent>(_onGetFiveDaysWeatherForecastEvent);
  }

  Future<void> _onGetCurrenWeather(
    GetWeatherEvent _,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final getCurrentWeatherUseCase = GetWeatherUseCase(weatherRepository: Get.find());
    final weather = await getCurrentWeatherUseCase(coordinates);
    emit(state.copyWith(isLoading: false, weather: weather));
  }

  Future<void> _onGetFiveDaysWeatherForecastEvent(
    GetFiveDaysWeatherForecastEvent _,
    Emitter<WeatherState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final getFiveDaysWeatherForecastUseCase = GetFiveDaysWeatherForecastUseCase(weatherRepository: Get.find());
    final forecast = await getFiveDaysWeatherForecastUseCase(coordinates);
    emit(state.copyWith(isLoading: false, forecast: forecast));
  }
}
