import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/user_service.dart';

class DeliveryService {
  final log = getLogger('DeliveryService');

  // Delivery Request List contains ALL requests
  List<dynamic> _deliveryRequestList = [];

  // My packages list contains only user's package requests
  List<dynamic> _myPackagesList = [];
  List<dynamic> get myPackagesList => _myPackagesList;

  // Latest requests list contains other users' package requests
  List<dynamic> _latestRequestList = [];
  List<dynamic> get latestRequestList => _latestRequestList;

  // Current tasks list contains all user's 'accepted' package requests
  List<dynamic> _currentTasksList = [];
  List<dynamic> get currentTasksList => _currentTasksList;

  // Keeps track of # of accepted packages with status delivering
  // Used for location tracking
  int _userDeliveringCount = 0;
  int get userDeliveringCount => _userDeliveringCount;

  bool _isUserDelivering = false;
  bool get isUserDelivering => _isUserDelivering;

  /// Sets isUserDelivering to true or false.
  ///
  /// When current user has at least one accepted request with
  /// status = 'delivering', isUserDelivering = true
  /// Or equivalently, when userDeliveringCount > 0
  ///
  /// Otherwise, when current user has no accepted request with
  /// status = 'delivering', isUserDelivering = false
  /// Or equivalently, when userDeliveringCount == 0
  void updateIsUserDeliverying() {
    _isUserDelivering = _userDeliveringCount > 0;
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
    updateLists();
    log.v('Package has been requested!');
  }

  Future<List<dynamic>> fetchDeliveryRequestList() async {
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
    _myPackagesList = _deliveryRequestList
        .where((packageRequest) =>
            packageRequest['user']['id'] ==
            _userService.currentUser.id)
        .toList();
    _latestRequestList = _deliveryRequestList
        .where((packageRequest) =>
            packageRequest['user']['id'] !=
            _userService.currentUser.id)
        .toList();
    _currentTasksList = _deliveryRequestList
        .where((packageRequest) =>
            !packageRequest['statusAccepted'].isEmpty &&
            packageRequest['statusAccepted']['deliverer']['id'] ==
                _userService.currentUser.id)
        .toList();
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
  /// to [deliveryStatus] index 2 ('delivering') and increment
  /// [userDeliveringCount] by one
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
      _userDeliveringCount++;
      updateIsUserDeliverying();
    } catch (e) {
      log.e('An error occurred. Could not pick up delivery request');
    }
  }
}
