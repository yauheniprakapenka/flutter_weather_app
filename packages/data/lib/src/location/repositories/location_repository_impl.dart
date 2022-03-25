import 'package:domain/domain.dart';

import '../datasource/i_location_local_data_source.dart';
import '../datasource/i_location_remote_data_source.dart';

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
        localCoordinates = await _localDataSource.getCoordinates();
      } on Exception catch (e) {
        return Left(Failure('$e'));
      }
    }
    return localCoordinates == null
        ? const Left(Failure('Coordinates is null'))
        : Right(localCoordinates);
  }
}
