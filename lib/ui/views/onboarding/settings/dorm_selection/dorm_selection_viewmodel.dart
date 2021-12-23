import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/constants/dorm_list.dart';
import 'package:vinkybox/services/user_service.dart';

class DormSelectionViewModel extends BaseViewModel {
  final log = getLogger("DormSelectionViewModel");

  String _userDorm = "";

  String get userDorm => _userDorm;

  bool hasSelectedDorm() => _userDorm != "";

  final NavigationService _navigationService =
      locator<NavigationService>();
  final UserService _userService = locator<UserService>();

  void selectUserDorm(int index) {
    _userDorm = dormList[index];
    notifyListeners();
    // print("User has selected: $_userDorm");
  }

  Future submitUserInfo() async {
    if (_userDorm != "") {
      log.i("Submitting user info");
      // set up user account
      await _userService.submitCurrentUserDorm(userDorm: _userDorm);
      _navigationService.navigateTo(Routes.homeView);
    } else {
      log.e("No dorm selected");
    }
  }
}
