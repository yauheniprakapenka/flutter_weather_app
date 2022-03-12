import 'package:data/src/location/datasource/i_location_remote_data_source.dart';
import 'package:domain/domain.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocationRemoteDataSource implements ILocationRemoteDataSource {
  @override
  Future<Coordinates> getCurrentLocation() async {
    try {
      final position = await _determinePosition();
      return Coordinates(latitude: position.latitude, longitude: position.longitude);
    } on Exception catch (_) {
      rethrow;
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return Geolocator.getCurrentPosition();
  }
}
