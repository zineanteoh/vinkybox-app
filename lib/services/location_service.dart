import 'package:location/location.dart';
import 'package:vinkybox/api/firebase_database_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/user_service.dart';

class LocationService {
  final log = getLogger('LocationService');

  final _firebaseDatabaseApi = locator<FirebaseDatabaseApi>();

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
    // Hard coding delivery key (a unique key that identifies package delivery)
    const deliveryKey = "key1";
    await _firebaseDatabaseApi.updateLocation(
        deliveryKey, _locationData.latitude, _locationData.longitude);
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
