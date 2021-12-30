import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:location/location.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/app_keys.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/google_map_service.dart';

class FirebaseDatabaseApi {
  final log = getLogger('FirebaseDatabaseApi');

  final locationUpdatesRef =
      FirebaseDatabase.instance.ref(LocationUpdatesRealtimeDBKey);
  // final _locationUpdates

  Future _updateLocation(String deliveryKey, String locationType,
      latitude, longitude) async {
    log.i(
        'Updating location to database $deliveryKey $latitude $longitude');
    AppLocation location = AppLocation(
        latitude: latitude.toString(),
        longitude: longitude.toString());
    try {
      await locationUpdatesRef
          .child('$deliveryKey/$locationType/location')
          .update(location.toJson());
    } catch (e) {
      log.e(e);
    }
  }

  /// updatePackageLocation updates the location of the package
  Future updatePackageLocation(
      String deliveryKey, latitude, longitude) async {
    _updateLocation(deliveryKey, 'package', latitude, longitude);
  }

  /// updateDestinationLocation writes the drop off location
  Future updateDestinationLocation(
      String deliveryKey, latitude, longitude) async {
    _updateLocation(deliveryKey, 'destination', latitude, longitude);
  }

  Future<DataSnapshot> _getLocation(
      String deliveryKey, String locationType) async {
    return locationUpdatesRef
        .child('$deliveryKey/$locationType/location')
        .get()
        .then((DataSnapshot snapshot) => snapshot);
  }

  /// getPackageLocation retrieves the location of the deliverer
  Future<DataSnapshot> getPackageLocation(String deliveryKey) async {
    return _getLocation(deliveryKey, 'package');
  }

  /// getDestinationLocation retrieves the location of the drop off location
  Future<DataSnapshot> getDestinationLocation(
      String deliveryKey) async {
    return _getLocation(deliveryKey, 'destination');
  }
}
