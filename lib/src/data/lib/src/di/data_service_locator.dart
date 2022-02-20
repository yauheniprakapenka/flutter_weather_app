import 'package:flutter_weather_app/src/data/lib/src/repositories/weather_repository_impl.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import 'package:get/instance_manager.dart';

import '../data_source/remote/openweathermap_remote_data_source/openweathermap_remote_data_source_impl.dart';

class DataServiceLocator {
  static void init() {
    Get.put<IWeatherRepository>(
      WeatherRepositoryImpl(
        remoteDataSource: OpenWeatherMapRemoteDataSourceImpl(),
      ),
    );
  }
}
