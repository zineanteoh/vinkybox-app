import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/app_keys.dart';
import 'package:vinkybox/models/application_models.dart';

class FirebaseDatabaseApi {
  final log = getLogger('FirebaseDatabaseApi');

  final _locationUpdatesRef =
      FirebaseDatabase.instance.ref(LocationUpdatesRealtimeDBKey);
  // final _locationUpdates

  Future _updateLocation(
      String deliveryKey, String locationType, lat, lng) async {
    log.i('Updating location to database $deliveryKey $lat $lng');
    AppLocation location =
        AppLocation(lat: lat.toString(), lng: lng.toString());
    try {
      await _locationUpdatesRef
          .child('$deliveryKey/$locationType/location')
          .update(location.toJson());
    } catch (e) {
      log.e(e);
    }
  }

  /// updateSourceLocation updates the location of the deliverer
  Future updateSourceLocation(String deliveryKey, lat, lng) async {
    _updateLocation(deliveryKey, 'source', lat, lng);
  }

  /// updateDestinationLocation writes the drop off location
  Future updateDestinationLocation(
      String deliveryKey, lat, lng) async {
    _updateLocation(deliveryKey, 'destination', lat, lng);
  }

  /// getSourceLocation retrieves the location of the deliverer
  Future<DataSnapshot> getSourceLocation(String deliveryKey) async {
    return _locationUpdatesRef
        .child('$deliveryKey/source/location')
        .get()
        .then((DataSnapshot snapshot) => snapshot);
  }
}
