import 'package:firebase_database/firebase_database.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/app_keys.dart';

class FirebaseDatabaseApi {
  final log = getLogger('FirebaseDatabaseApi');

  final locationUpdatesRef =
      FirebaseDatabase.instance.ref(LocationUpdatesRealtimeDBKey);
  // final _locationUpdates

  Future updateLocation(deliveryKey, lat, lng) async {
    log.i('Updating location to database $deliveryKey $lat $lng');
    try {
      await locationUpdatesRef
          .child('$deliveryKey/source/location')
          .update({'lat': lat, 'lng': lng});
    } catch (e) {
      log.e(e);
    }
  }
}
