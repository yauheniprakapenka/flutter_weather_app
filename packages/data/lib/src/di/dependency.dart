import 'package:domain/domain.dart';
import 'package:get/get.dart';

import '../data_source/remote/location/geo_location_remote_data_source/geo_location_remote_data_source.dart';
import '../data_source/remote/openweathermap/openweathermap_remote_data_source/openweathermap_remote_data_source_impl.dart';
import '../repositories/location_repository_impl.dart';
import '../repositories/weather_repository_impl.dart';

void initDomainDependencies() {
  Get
    ..put<IWeatherRepository>(WeatherRepositoryImpl(OpenWeatherMapRemoteDataSourceImpl()))
    ..put<ILocationRepository>(LocationRepositoryImpl(GeoLocationRemoteDataSource()));
}
