import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/app/app.router.dart';
// import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/services/firebase_authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  final log = getLogger('LoginViewModel');

  Future loginWithGoogle() async {
    // Uncomment the below
    final result =
        await _firebaseAuthenticationService.signInWithGoogle();
    _handleAuthenticationResponse(result);

    // Temporary
    // final _navigationServce = locator<NavigationService>();
    // _navigationServce.navigateTo(Routes.onboardingView);
  }

  void _handleAuthenticationResponse(
      FirebaseAuthenticationResult result) {
    if (!result.hasError) {
      // if first time, go to onboarding view -> dorm_selection
      _navigationService.replaceWith(Routes.onboardingView);
      // TODO: else go to home page
    } else {
      log.e('Error signing in with Google.');
    }
  }
}
