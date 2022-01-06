import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/services/user_service.dart';

class DeliveryRequestItemModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _deliveryService = locator<DeliveryService>();

  bool _pressed = false;
  bool get pressed => _pressed;

  bool _cancelPressed = false;
  bool get cancelPressed => _cancelPressed;

  bool _acceptPressed = false;
  bool get acceptPressed => _acceptPressed;

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

  late dynamic _deliveryRequest;
  late dynamic _deliveryId;
  late String nameInfo;
  late String timeInfo;
  late String statusInfo;
  late String dormInfo;
  late String packageSizeInfo;
  late String pickUpLocationInfo;
  late String dropOffLocationInfo;

  void onModelReadyLoad(dynamic request) {
    _deliveryRequest = request;
    _deliveryId = request['id'];
    nameInfo = request['user']['fullName'];
    timeInfo = request['time'];
    statusInfo = request['status'];
    dormInfo = request['user']['dorm'];
    packageSizeInfo = request['packageSize'];
    pickUpLocationInfo = request['pickUpLocation'];
    dropOffLocationInfo = request['dropOffLocation'];
  }

  bool isMyPackage() {
    return _deliveryRequest['user']['email'] ==
        _userService.currentUser.email;
  }

  Future acceptRequest() async {
    await _deliveryService.acceptRequest(_deliveryId);
  }
}
