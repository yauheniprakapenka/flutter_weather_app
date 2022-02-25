import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionManager {
  static Future<bool> hasInternet() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
