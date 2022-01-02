import 'package:stacked/stacked.dart';

class DeliveryRequestItemModel extends BaseViewModel {
  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  late String nameInfo;
  late String timeInfo;
  late String statusInfo;
  late String packageSizeInfo;
  late String pickUpLocationInfo;
  late String dropOffLocationInfo;

  void onModelReadyLoad(dynamic request) {
    nameInfo = request['user']['fullName'];
    timeInfo = request['time'];
    statusInfo = request['status'];
    packageSizeInfo = request['packageSize'];
    pickUpLocationInfo = request['pickUpLocation'];
    dropOffLocationInfo = request['user']['dorm'];
  }
}
