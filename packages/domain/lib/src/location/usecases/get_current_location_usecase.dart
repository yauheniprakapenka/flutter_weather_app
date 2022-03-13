import 'package:dartz/dartz.dart';

import '../../entities/failure.dart';
import '../entities/coordinates.dart';
import '../repositories/i_location_repository.dart';

class GetCurrentLocationUseCase {
  final ILocationRepository _iLocationRepository;

  const GetCurrentLocationUseCase(this._iLocationRepository);

  Future<Either<Failure, Coordinates>> call() async {
    return _iLocationRepository.getCurrentLocation();
  }
}
