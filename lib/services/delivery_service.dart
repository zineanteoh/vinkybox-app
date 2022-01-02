import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/user_service.dart';

class DeliveryService {
  final log = getLogger('DeliveryService');

  List<dynamic> _deliveryRequestList = [];
  List<dynamic> get deliveryRequestList => _deliveryRequestList;

  List<dynamic> _myPackagesList = [];
  List<dynamic> get myPackagesList => _myPackagesList;

  final _firestoreApi = locator<FirestoreApi>();
  final _userService = locator<UserService>();

  Future submitNewDeliveryRequest(
      {required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation}) async {
    await _firestoreApi.createDeliveryRequest(
      req: PackageRequest(
          user: _userService.currentUser.toJson(),
          status: deliveryStatus[0],
          packageSize: packageSize,
          pickUpLocation: pickUpLocation,
          dropOffLocation: dropOffLocation,
          time: DateTime.now().toString()),
    );
    updateMyPackagesList();
    log.v('Package has been requested!');
  }

  Future<List<dynamic>> fetchDeliveryRequestList() async {
    _deliveryRequestList =
        await _firestoreApi.fetchDeliveryRequestList();
    return _deliveryRequestList;
  }

  void updateMyPackagesList() {
    _myPackagesList = _deliveryRequestList
        .where((packageRequest) =>
            packageRequest['user']['id'] ==
            _userService.currentUser.id)
        .toList();
  }
}
