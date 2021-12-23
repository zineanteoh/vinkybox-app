import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/helpers/email_parser.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/firebase_authentication_service.dart';
import 'package:vinkybox/services/user_service.dart';
// import 'package:vinkybox/services/firebase_authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final _userService = locator<UserService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  final log = getLogger('LoginViewModel');

  void loginWithGoogle() {
    log.v('[Temporary] Pretending to login with Google');

    _firebaseAuthenticationService.signInWithGoogle();

    // Temporary CODE!
    // TEMPORARY -- set UserService currentUser to some dummy data
    const tempEmail = "zi.nean.teoh@vanderbilt.edu";
    _userService.setCurrentUser(AppUser(
      id: "123456789",
      email: tempEmail,
      fullName: getFullNameFromEmail(tempEmail),
    ));
    final _navigationServce = locator<NavigationService>();
    _navigationServce.navigateTo(Routes.onboardingView);
  }
}
