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

  NavigationService _navigationService = locator<NavigationService>();
  UserService _userService = locator<UserService>();

  void selectUserDorm(int index) {
    _userDorm = dormList[index];
    // print("User has selected: $userDorm");
  }

  void submitUserInfo() {
    if (_userDorm != "") {
      print("You have selected: $_userDorm");
      // set up user account
      _userService.createUserInFirestore(userDorm: _userDorm);
      _navigationService.navigateTo(Routes.homeView);
    } else {
      log.e("No dorm selected");
    }
  }
}
