import 'package:firebase_database/firebase_database.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/app_keys.dart';

class FirebaseDatabaseApi {
  final log = getLogger('FirebaseDatabaseApi');

  final locationUpdatesRef =
      FirebaseDatabase.instance.ref(LocationUpdatesRealtimeDBKey);
  // final _locationUpdates

  /// updateSourceLocation updates the location of the deliverer
  Future updateSourceLocation(deliveryKey, lat, lng) async {
    log.i('Updating location to database $deliveryKey $lat $lng');
    try {
      await locationUpdatesRef
          .child('$deliveryKey/source/location')
          .update({'lat': lat, 'lng': lng});
    } catch (e) {
      log.e(e);
    }
  }

  /// updateDestinationLocation writes the drop off location
  Future updateDestinationLocation(deliveryKey, lat, lng) async {
    // lat and lng will be hard coded with some constants
    log.i('Updating destination loaction to database.');
    try {
      await locationUpdatesRef
          .child('$deliveryKey/destination/location')
          .update({'lat': lat, 'lng': lng});
    } catch (e) {
      log.e(e);
    }
  }
}
