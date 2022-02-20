import 'package:flutter_weather_app/src/data/lib/src/data_source/remote/weather_mock_remote_data_source/weather_mock_remote_data_source.dart';
import 'package:flutter_weather_app/src/data/lib/src/repositories/weather_repository_impl.dart';
import 'package:flutter_weather_app/src/domain/lib/domain.dart';
import 'package:get/instance_manager.dart';

class DataServiceLocator {
  static void init() {
    Get.put<IWeatherRepository>(
      WeatherRepositoryImpl(
        remoteDataSource: WeatherMockRemoteDataSource(),
      ),
    );
  }
}
