import 'package:stacked/stacked.dart';

class DeliveryRequestItemModel extends BaseViewModel {
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

  late String nameInfo;
  late String timeInfo;
  late String statusInfo;
  late String dormInfo;
  late String packageSizeInfo;
  late String pickUpLocationInfo;
  late String dropOffLocationInfo;

  void onModelReadyLoad(dynamic request) {
    nameInfo = request['user']['fullName'];
    timeInfo = request['time'];
    statusInfo = request['status'];
    dormInfo = request['user']['dorm'];
    packageSizeInfo = request['packageSize'];
    pickUpLocationInfo = request['pickUpLocation'];
    dropOffLocationInfo = request['dropOffLocation'];
  }
}
