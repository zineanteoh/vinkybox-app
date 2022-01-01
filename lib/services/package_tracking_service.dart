import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:vinkybox/api/firebase_database_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/google_map_service.dart';

class PackageTrackingService {
  final log = getLogger('PackageTrackingService');

  // locators
  final _firebaseDatabaseAPI = locator<FirebaseDatabaseApi>();
  final _googleMapService = locator<GoogleMapService>();

  late StreamSubscription<DatabaseEvent> _trackingListeners;

  /// activatePackageTrackingListeners listens to location of the deliverer
  void activatePackageTrackingListeners(
      String deliveryKey, Function notifyListeners) {
    _trackingListeners = _firebaseDatabaseAPI.locationUpdatesRef
        .child('$deliveryKey/package/location')
        .onValue
        .listen(
      (event) {
        String encodedJson = jsonEncode(event.snapshot.value);
        Map<String, dynamic> valueMap = jsonDecode(encodedJson);
        double latitude = double.parse(valueMap['latitude']);
        double longitude = double.parse(valueMap['longitude']);
        _googleMapService.updateMarker(
            latitude, longitude, notifyListeners);
      },
    );
  }

  void unsubscribePackageTracking() {
    _trackingListeners.cancel();
  }
}
