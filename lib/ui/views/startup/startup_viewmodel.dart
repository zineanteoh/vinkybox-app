import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/services/user_service.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');

  final _userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();

  void runStartupLogic() async {
    if (_userService.hasLoggedInUser) {
      log.v(
          'We have a user session on disk. Sync the user profile ...');
      await _userService.syncUserAccount();

      final currentUser = _userService.currentUser;
      log.v('User sync complete. User profile: $currentUser');

      // navigate to home view
      _navigationService.replaceWith(Routes.homeView);
    } else {
      log.v('No user on disk, navigate to the LoginView');
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
