import 'package:domain/domain.dart';

import '../datasource/local/i_location_local_data_source.dart';
import '../datasource/remote/i_location_remote_data_source.dart';

class LocationRepositoryImpl implements ILocationRepository {
  final ILocationLocalDataSource _localDataSource;
  final ILocationRemoteDataSource _remoteDataSource;

  const LocationRepositoryImpl({
    required ILocationLocalDataSource localDataSource,
    required ILocationRemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, Coordinates>> getCurrentLocation() async {
    var localCoordinates = await _localDataSource.getCoordinates();
    if (localCoordinates == null) {
      try {
        final remoteCoordinates = await _remoteDataSource.getCurrentLocation();
        await _localDataSource.saveLocation(remoteCoordinates);
        localCoordinates = remoteCoordinates;
      } on Exception catch (e) {
        return Left(Failure(message: '$e'));
      }
    }
    return Right(localCoordinates);
  }
}
