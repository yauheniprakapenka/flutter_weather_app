import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';

void initDomainDependencies() {
  Get
    ..put<IWeatherRepository>(WeatherRepositoryImpl(OpenWeatherMapRemoteDataSourceImpl()))
    ..put<ILocationRepository>(LocationRepositoryImpl(GeoLocationRemoteDataSource()));
}
