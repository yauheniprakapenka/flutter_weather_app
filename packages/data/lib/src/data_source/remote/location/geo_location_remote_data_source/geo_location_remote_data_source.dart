import 'package:data/src/data_source/remote/location/interface/i_location_remote_data_source.dart';
import 'package:domain/domain.dart';

import '../../../../services/geo_locator_service/geo_locator_service.dart';

class GeoLocationRemoteDataSource implements ILocationRemoteDataSource {
  @override
  Future<Coordinates> getCurrentLocation() async {
    return GeoLocatorService().getCurrentLocation();
  }

}