import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/user_service.dart';

class HomeViewModel extends BaseViewModel {
  final _userService = locator<UserService>();

  String? getCurrentUserName() {
    return _userService.currentUser.fullName;
  }
}
