import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';
import 'package:vinkybox/api/firebase_database_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/google_map_service.dart';

class LocationTrackingService {
  final log = getLogger('LocationTrackingService');

  final _firebaseDatabaseApi = locator<FirebaseDatabaseApi>();
  final _googleMapService = locator<GoogleMapService>();

  final Location _location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  LocationData get locationData => _locationData;

  late StreamSubscription<LocationData> _locationListeners;

  Future<LocationData> getLocation() async {
    _locationData = await _location.getLocation();
    return _locationData;
  }

  Future requestLocationTrackingPermission() async {
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
  }

  Future initializeLocationTracking(
      Function notifyListeners, String deliveryId) async {
    _locationData = await _location.getLocation();
    await _firebaseDatabaseApi.updatePackageLocation(
        deliveryId, _locationData.latitude, _locationData.longitude);

    _locationListeners = _location.onLocationChanged.listen(
      (LocationData currentLocation) async {
        await _firebaseDatabaseApi.updatePackageLocation(deliveryId,
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

  Future<Map<String, double>> getPackageLocation(
      String deliveryId) async {
    DataSnapshot snapshot =
        await _firebaseDatabaseApi.getPackageLocation(deliveryId);

    String encodedJson = jsonEncode(snapshot.value);
    Map<String, dynamic> valueMap = jsonDecode(encodedJson);
    Map<String, double> packageLocation = {};
    packageLocation['latitude'] = double.parse(valueMap['latitude']);
    packageLocation['longitude'] =
        double.parse(valueMap['longitude']);

    return packageLocation;
  }

  Future<Map> getDestinationLocation() async {
    DataSnapshot snapshot =
        await _firebaseDatabaseApi.getDestinationLocation('key1');

    String encodedJson = jsonEncode(snapshot.value);
    Map valueMap = jsonDecode(encodedJson);

    return valueMap;
  }

  Future unsubscribeLocationTracking() async {
    log.i('Unsubscribing to all location listeners');
    await _locationListeners.cancel();
  }
}
