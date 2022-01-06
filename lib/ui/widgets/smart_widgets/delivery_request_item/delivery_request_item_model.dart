import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/services/user_service.dart';

class DeliveryRequestItemModel extends BaseViewModel {
  final log = getLogger('DeliveryRequestItemModel');

  final _userService = locator<UserService>();
  final _deliveryService = locator<DeliveryService>();

  bool _pressed = false;
  bool get pressed => _pressed;

  bool _cancelPressed = false;
  bool get cancelPressed => _cancelPressed;

  bool _acceptPressed = false;
  bool get acceptPressed => _acceptPressed;

  bool _trackPackagePressed = false;
  bool get trackPackagePressed => _trackPackagePressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  void updateCancelPressedStatus(tapState) {
    _cancelPressed = tapState;
    notifyListeners();
  }

  void updateAcceptPressedStatus(tapState) {
    _acceptPressed = tapState;
    notifyListeners();
  }

  void updateTrackPackagePressedStatus(tapState) {
    _acceptPressed = tapState;
    notifyListeners();
  }

  late dynamic _deliveryRequest;
  late dynamic _deliveryId;
  late String nameInfo;
  late String timeInfo;
  late String statusInfo;
  late String dormInfo;
  late String packageSizeInfo;
  late String pickUpLocationInfo;
  late String dropOffLocationInfo;
  late String delivererNameInfo;

  void onModelReadyLoad(dynamic request) {
    log.i(request);
    _deliveryRequest = request;
    _deliveryId = request['id'];
    nameInfo = request['user']['fullName'];
    timeInfo = request['time'];
    statusInfo = request['status'];
    dormInfo = request['user']['dorm'];
    packageSizeInfo = request['packageSize'];
    pickUpLocationInfo = request['pickUpLocation'];
    dropOffLocationInfo = request['dropOffLocation'];
    if (statusInfo != deliveryStatus[0]) {
      // if delivery status is not new
      delivererNameInfo =
          request['status-accepted']['deliverer']['fullName'];
    }
  }

  bool isMyPackage() {
    return _deliveryRequest['user']['email'] ==
        _userService.currentUser.email;
  }

  bool statusIsNotNew() {
    return statusInfo != deliveryStatus[0];
  }

  Future acceptRequest() async {
    await _deliveryService.acceptRequest(_deliveryId);
  }
}
