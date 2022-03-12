import '../entities/coordinates.dart';

abstract class ILocationRepository {
  Future<Coordinates> getCurrentLocation();
}
