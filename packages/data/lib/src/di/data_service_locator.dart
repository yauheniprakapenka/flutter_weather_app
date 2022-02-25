import 'package:domain/domain.dart';
import 'package:get/get.dart';

import '../data_source/remote/openweathermap_remote_data_source/openweathermap_remote_data_source_impl.dart';
import '../repositories/weather_repository_impl.dart';

class DataServiceLocator {
  static void init() {
    Get.put<IWeatherRepository>(
      WeatherRepositoryImpl(
        remoteDataSource: OpenWeatherMapRemoteDataSourceImpl(),
      ),
    );
  }
}
