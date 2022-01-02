import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';
import 'package:vinkybox/api/firebase_database_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/google_map_service.dart';

class LocationService {
  final log = getLogger('LocationService');

  final _firebaseDatabaseApi = locator<FirebaseDatabaseApi>();
  final _googleMapService = locator<GoogleMapService>();

  final Location _location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  LocationData get locationData => _locationData;

  late StreamSubscription<LocationData> _locationListeners;

  // TEMPORARY
  bool isDelivering = true;
  void setIsDeliverying(bool val) {
    isDelivering = val;
  }

  // Hard coding delivery key (a unique key that identifies package delivery)
  final deliveryKey = "key1";

  Future initializeLocationTracking(Function notifyListeners) async {
    log.i('Initializing location service $isDelivering');
    log.i('Requesting permission...');

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        log.i('Service not enabled.');
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        log.i('Permission not granted');
        return;
      }
    }

    _locationData = await _location.getLocation();
    await _firebaseDatabaseApi.updatePackageLocation(
        deliveryKey, _locationData.latitude, _locationData.longitude);

    _locationListeners = _location.onLocationChanged.listen(
      (LocationData currentLocation) async {
        await _firebaseDatabaseApi.updatePackageLocation(deliveryKey,
            currentLocation.latitude, currentLocation.longitude);
        // Update markers on map
        await _googleMapService.updateMarker(
            currentLocation.latitude!,
            currentLocation.longitude!,
            notifyListeners);
      },
    );
    log.i('Location is $_locationData');
  }

  Future<Map> getPackageLocation() async {
    DataSnapshot snapshot =
        await _firebaseDatabaseApi.getPackageLocation('key1');

    String encodedJson = jsonEncode(snapshot.value);
    Map valueMap = jsonDecode(encodedJson);

    return valueMap;
  }

  Future<Map> getDestinationLocation() async {
    DataSnapshot snapshot =
        await _firebaseDatabaseApi.getDestinationLocation('key1');

    String encodedJson = jsonEncode(snapshot.value);
    Map valueMap = jsonDecode(encodedJson);

    return valueMap;
  }

  void unsubscriveLocationTracking() {
    _locationListeners.cancel();
  }
}
