import 'package:dartz/dartz.dart';
import 'package:domain/src/location/entities/coordinates.dart';
import 'package:domain/src/location/repositories/i_location_repository.dart';

import '../../entities/failure.dart';

class GetCurrentLocationUseCase {
  final ILocationRepository _iLocationRepository;

  const GetCurrentLocationUseCase(this._iLocationRepository);

  Future<Either<Failure, Coordinates>> call() async {
    return _iLocationRepository.getCurrentLocation();
  }
}
