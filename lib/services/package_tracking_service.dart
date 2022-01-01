import 'dart:convert';

import 'package:vinkybox/api/firebase_database_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/google_map_service.dart';

class PackageTrackingService {
  final log = getLogger('PackageTrackingService');

  // locators
  final _firebaseDatabaseAPI = locator<FirebaseDatabaseApi>();
  final _googleMapService = locator<GoogleMapService>();

  /// activatePackageTrackingListeners listens to location of the deliverer
  void activatePackageTrackingListeners(
      String deliveryKey, Function notifyListeners) {
    _firebaseDatabaseAPI.locationUpdatesRef
        .child('$deliveryKey/package/location')
        .onValue
        .listen(
      (event) {
        String encodedJson = jsonEncode(event.snapshot.value);
        log.i('Encodedjson: $encodedJson');
        Map<String, dynamic> valueMap = jsonDecode(encodedJson);
        log.i('valueMap: $valueMap');
        double latitude = double.parse(valueMap['latitude']);
        double longitude = double.parse(valueMap['longitude']);
        _googleMapService.updateMarker(
            latitude, longitude, notifyListeners);
      },
    );
  }
}
