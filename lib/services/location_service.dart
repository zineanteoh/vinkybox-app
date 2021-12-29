import 'package:location/location.dart';
import 'package:vinkybox/app/app.logger.dart';

class LocationService {
  final log = getLogger('LocationService');

  Location location = Location();
  late LocationData _locationData;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  Future initializeLocationService() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        log.i('Location Permission not granted.');
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    log.i('Location is $_locationData');
  }

  Future getCurrentLocation() async {
    if (_serviceEnabled &&
        _permissionGranted == PermissionStatus.granted) {
      _locationData = await location.getLocation();
    } else {
      log.i('Location is not enabled :(');
    }
  }
}
