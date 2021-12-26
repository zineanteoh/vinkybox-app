import 'package:stacked/stacked.dart';

class DeliveryRequestItemModel extends BaseViewModel {
  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }
}
