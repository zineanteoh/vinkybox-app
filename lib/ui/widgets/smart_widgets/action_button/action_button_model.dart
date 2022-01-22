import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/delivery_service.dart';

class ActionButtonModel extends ReactiveViewModel {
  bool _pressed = false;
  bool get pressed => _pressed;

  final DeliveryService _deliveryService = locator<DeliveryService>();
  int get currentTaskAlertCount =>
      _deliveryService.currentTaskListCount;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  void onPress(Function onPressFunction) {
    onPressFunction();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_deliveryService];
}
