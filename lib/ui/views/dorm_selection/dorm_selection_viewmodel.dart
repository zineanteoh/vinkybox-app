import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/constants/dorm_list.dart';

class DormSelectionViewModel extends BaseViewModel {
  late String _userDorm;

  NavigationService _navigationService = locator<NavigationService>();

  void selectUserDorm(int index) {
    _userDorm = dormList[index];
    // print("User has selected: $userDorm");
  }

  void submitUserDorm() {
    print("You have selected: $_userDorm");
    _navigationService.navigateTo(Routes.homeView);
  }
}
