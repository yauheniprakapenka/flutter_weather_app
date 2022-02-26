import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';

void init() {
  Get.put<IWeatherRepository>(
    WeatherRepositoryImpl(
      remoteDataSource: OpenWeatherMapRemoteDataSourceImpl(),
    ),
  );
}
