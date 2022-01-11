import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';

class OpenMapButtonModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  void onPress() {
    _navigationService.navigateTo(Routes.locationView);
  }
}
