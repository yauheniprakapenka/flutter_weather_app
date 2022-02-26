import '../entities/entities.dart';

abstract class ILocationRepository {
  Future<Coordinates> getCurrentLocation();
}
