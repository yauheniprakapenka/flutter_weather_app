import 'package:data/src/location/datasource/i_location_remote_data_source.dart';
import 'package:domain/domain.dart';

class LocationRepositoryImpl implements ILocationRepository {
  final ILocationRemoteDataSource _remoteDataSource;

  const LocationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Coordinates> getCurrentLocation() async {
    return _remoteDataSource.getCurrentLocation();
  }
}
