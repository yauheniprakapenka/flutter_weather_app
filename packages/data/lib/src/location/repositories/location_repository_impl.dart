import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

import '../datasource/i_location_remote_data_source.dart';

class LocationRepositoryImpl implements ILocationRepository {
  final ILocationRemoteDataSource _remoteDataSource;

  const LocationRepositoryImpl({required ILocationRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, Coordinates>> getCurrentLocation() async {
    try {
      final coordinates = await _remoteDataSource.getCurrentLocation();
      return Right(coordinates);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
