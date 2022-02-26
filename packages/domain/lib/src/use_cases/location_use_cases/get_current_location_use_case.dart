import 'package:domain/src/entities/coordinates.dart';
import 'package:domain/src/repositories/i_location_repository.dart';

class GetCurrentLocationUseCase {
  final ILocationRepository _iLocationRepository;

  const GetCurrentLocationUseCase(this._iLocationRepository);

  Future<Coordinates> call() async {
    return _iLocationRepository.getCurrentLocation();
  }
}
