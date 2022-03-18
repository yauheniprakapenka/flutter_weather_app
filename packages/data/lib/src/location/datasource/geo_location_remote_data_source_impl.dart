import 'package:domain/domain.dart';
import 'package:geolocator/geolocator.dart';

import 'i_location_remote_data_source.dart';

class GeoLocationRemoteDataSourceImpl implements ILocationRemoteDataSource {
  @override
  Future<Coordinates> getCurrentLocation() async {
    try {
      final position = await _determinePosition();
      return Coordinates(latitude: position.latitude, longitude: position.longitude);
    } on Exception {
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
      throw Exception('Allow access to your location to display the weather for your current location.');
    }

    return Geolocator.getCurrentPosition();
  }
}
