import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/location_tracking_service.dart';
import 'package:vinkybox/services/user_service.dart';

class DeliveryService {
  final log = getLogger('DeliveryService');

  // Delivery Request List contains ALL requests
  PackageRequestList _deliveryRequestList = PackageRequestList();

  // My packages list contains only user's package requests
  PackageRequestList _myPackagesList = PackageRequestList();
  PackageRequestList get myPackagesList => _myPackagesList;
  void setMyPackagesList(PackageRequestList list) {
    _myPackagesList = list;
  }

  // Latest requests list contains other users' package requests
  PackageRequestList _latestRequestList = PackageRequestList();
  PackageRequestList get latestRequestList => _latestRequestList;
  void setLatestRequestList(PackageRequestList list) {
    _latestRequestList = list;
  }

  // Current tasks list contains all user's 'accepted' package requests
  PackageRequestList _currentTasksList = PackageRequestList();
  PackageRequestList get currentTasksList => _currentTasksList;
  void setCurrentTaskList(PackageRequestList list) {
    _currentTasksList = list;
  }

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
        time: DateTime.now().toString(),
        statusAccepted: {},
      ),
    );
    // need to fetch request again (should be one operation)
    _deliveryRequestList =
        await _firestoreApi.fetchDeliveryRequestList();
    updateLists();
    log.v('Package has been requested!');
  }

  Future<PackageRequestList> fetchDeliveryRequestList() async {
    _deliveryRequestList =
        await _firestoreApi.fetchDeliveryRequestList();
    updateLists();
    return _deliveryRequestList;
  }

  /// Updates the [_myPackagesList], [_latestRequestList],
  /// and [_currentTasksList]
  ///
  /// Filters the [_deliveryRequestList] by checking if the
  /// user id of packageRequest is the same as the id of
  /// currentUser.
  ///
  /// If packageRequest user id is the same, add the request
  /// to [_myPackagesList].
  ///
  /// Otherwise add the request to [_latestRequestList].
  void updateLists() {
    List<PackageRequest> temp = [];

    // myPackages
    temp = _deliveryRequestList.requestList
        .where((packageRequest) =>
            packageRequest.user['id'] == _userService.currentUser.id)
        .toList();
    _myPackagesList = PackageRequestList(requestList: temp);

    // latestRequest
    temp = _deliveryRequestList.requestList
        .where((packageRequest) =>
            packageRequest.user['id'] != _userService.currentUser.id)
        .toList();
    _latestRequestList = PackageRequestList(requestList: temp);

    // currentTask
    temp = _deliveryRequestList.requestList
        .where((packageRequest) =>
            packageRequest.statusAccepted.isNotEmpty &&
            packageRequest.statusAccepted['deliverer']['id'] ==
                _userService.currentUser.id)
        .toList();
    _currentTasksList = PackageRequestList(requestList: temp);
  }

  /// Calls [FirestoreApi] to accept a request of [deliveryId]
  ///
  /// Add a 'statusAccepted' json that includes the deliverer
  /// and time info to the document of [deliveryId]
  ///
  /// If successful, change the request of [deliveryId] status
  /// to [deliveryStatus] index 1 ('collecting')
  ///
  /// If unsuccessful, prompt a dialog message saying request
  /// could not be accepted
  Future acceptRequest(String deliveryId) async {
    Map<String, dynamic> acceptRequestInfo = {
      'statusAccepted': {
        'deliverer': _userService.currentUser.toJson(),
        'time': DateTime.now().toString(),
      }
    };

    try {
      await _firestoreApi.acceptDeliveryRequest(
          deliveryId, acceptRequestInfo, deliveryStatus[1]);
    } catch (e) {
      log.e("An error occurred. Could not accept delivery request");
    }
  }

  /// Calls [FirestoreApi] to pick up a request of [deliveryId]
  ///
  /// Add a 'statusPickedUp' json that includes the pickup
  /// time to the document of [deliveryId]
  ///
  /// If successful, change the request of [deliveryId] status
  /// to [deliveryStatus] index 2 ('delivering')
  ///
  /// If unsuccessful, prompt a dialog message saying request
  /// could not be picked up
  Future pickUpRequest(String deliveryId) async {
    Map<String, dynamic> pickUpRequestInfo = {
      'statusPickUp': {
        'time': DateTime.now().toString(),
      }
    };
    try {
      await _firestoreApi.pickUpDeliveryRequest(
          deliveryId, pickUpRequestInfo, deliveryStatus[2]);
    } catch (e) {
      log.e('An error occurred. Could not pick up delivery request');
    }
  }
}
