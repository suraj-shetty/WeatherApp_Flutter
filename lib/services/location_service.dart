import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  Future<LocationData?> getLocation() async {
    final hasPermission = await _location.hasPermission();
    if (hasPermission == PermissionStatus.denied) {
      await _location.requestPermission();
    }

    return await _location.getLocation();
  }
}