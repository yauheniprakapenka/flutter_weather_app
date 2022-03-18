import 'package:domain/domain.dart';

import 'i_location_local_data_source.dart';

class MemoryLocationLocalDataSourceImpl implements ILocationLocalDataSource {
  Coordinates? _coordinates;

  @override
  Future<Coordinates?> getCoordinates() async {
    return Future.value(_coordinates);
  }

  @override
  Future<void> saveLocation(Coordinates coordinates) async {
    _coordinates = coordinates;
  }
}
