import 'package:domain/domain.dart';

abstract class ILocationRemoteDataSource {
  Future<Coordinates> getCurrentLocation();
}