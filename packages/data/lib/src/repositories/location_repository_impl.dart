import 'package:data/src/data_source/remote/location/interface/i_location_remote_data_source.dart';
import 'package:domain/domain.dart';

class LocationRepositoryImpl implements ILocationRepository {
  final ILocationRemoteDataSource _remoteDataSource;

  const LocationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Coordinates> getCurrentLocation() async {
    return _remoteDataSource.getCurrentLocation();
  }
}
