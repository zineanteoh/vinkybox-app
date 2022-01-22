import 'package:stacked/stacked.dart';

class ActionButtonModel extends BaseViewModel {
  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  void onPress(Function onPressFunction) {
    onPressFunction();
  }
}
