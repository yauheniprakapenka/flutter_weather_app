import 'package:data/src/location/datasource/i_location_remote_data_source.dart';
import 'package:domain/domain.dart';

import '../services/geo_locator_service/geo_locator_service.dart';

class GeoLocationRemoteDataSource implements ILocationRemoteDataSource {
  @override
  Future<Coordinates> getCurrentLocation() async {
    return GeoLocatorService().getCurrentLocation();
  }

}