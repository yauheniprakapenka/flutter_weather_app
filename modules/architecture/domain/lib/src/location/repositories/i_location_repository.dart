import 'package:dartz/dartz.dart';

import '../../entities/failure.dart';
import '../entities/coordinates.dart';

abstract class ILocationRepository {
  Future<Either<Failure, Coordinates>> getCurrentLocation();
}
