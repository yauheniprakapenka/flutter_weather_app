import 'package:domain/src/location/entities/coordinates.dart';
import 'package:domain/src/location/repositories/i_location_repository.dart';

class GetCurrentLocationUseCase {
  final ILocationRepository _iLocationRepository;

  const GetCurrentLocationUseCase(this._iLocationRepository);

  Future<Coordinates> call() async {
    return _iLocationRepository.getCurrentLocation();
  }
}
