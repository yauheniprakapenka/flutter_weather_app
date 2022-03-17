import 'package:domain/domain.dart';
import 'package:get/get.dart';

import '../location/datasource/geo_location_remote_data_source.dart';
import '../location/repositories/location_repository_impl.dart';
import '../weather/datasource/memory_weather_local_data_source_impl.dart';
import '../weather/datasource/openweathermap_remote_data_source_impl.dart';
import '../weather/repositories/weather_repository_impl.dart';

void initDomainDependencies() {
  Get
    ..put<IWeatherRepository>(
      WeatherRepositoryImpl(
        localDataSource: MemoryWeatherLocalDataSourceImpl(),
        remoteDataSource: OpenweathermapRemoteDataSourceImpl(),
      ),
    )
    ..put<ILocationRepository>(
      LocationRepositoryImpl(
        remoteDataSource: GeoLocationRemoteDataSource(),
      ),
    );
}
