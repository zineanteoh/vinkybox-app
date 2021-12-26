import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/user_service.dart';

class DeliveryService {
  final log = getLogger('DeliveryService');

  List<dynamic> _deliveryRequestList = [];
  List<dynamic> get deliveryRequestList => _deliveryRequestList;

  final _firestoreApi = locator<FirestoreApi>();
  final _userService = locator<UserService>();

  Future submitNewDeliveryRequest(
      {required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation}) async {
    await _firestoreApi.createDeliveryRequest(
      req: PackageRequest(
          user: _userService.currentUser.toJson(),
          status: "New",
          packageSize: packageSize,
          pickUpLocation: pickUpLocation,
          dropOffLocation: dropOffLocation,
          time: DateTime.now().toString()),
    );
    log.v('Package has been requested!');
  }

  Future<List<dynamic>> fetchDeliveryRequestList() async {
    _deliveryRequestList =
        await _firestoreApi.fetchDeliveryRequestList();
    return _deliveryRequestList;
  }
}
