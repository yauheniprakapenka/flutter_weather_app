import 'package:domain/domain.dart';

abstract class ILocationLocalDataSource {
  Future<void> saveLocation(Coordinates coordinates);

  Future<Coordinates?> getCoordinates();
}
