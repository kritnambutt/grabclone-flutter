// ignore_for_file: unused_element
import 'package:geolocator/geolocator.dart';

abstract class LocationServiceClass {
  Future<bool> handleLocationPermission();
  Future<Map<String, dynamic>> getCurrentPosition();
}

class LocationService extends LocationServiceClass {
  LocationService();

  @override
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  @override
  Future<Map<String, dynamic>> getCurrentPosition() async {
    LocationPermission permission;
    Position? position;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return {
          "permission": LocationPermission.denied,
          "position": position,
        };
      }
    }

    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return {
      "permission": permission,
      "position": position,
    };
  }
}
