import 'dart:async';

import 'package:geolocator/geolocator.dart';

import '../../entities/entities.dart';
import 'geo_locator_error.dart';

class GeoLocatorProvider {
  Future<Coordinates> getCoordinates() async {
    final position = await _determinePosition().catchError((error, _) {
      throw GeoLocatorError(error);
    });
    return Coordinates(latitude: position.latitude, longitude: position.longitude);
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }

  return Geolocator.getCurrentPosition();
}
