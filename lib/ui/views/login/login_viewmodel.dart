import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/services/firebase_authentication_service.dart';
// import 'package:vinkybox/services/firebase_authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  // final _firebaseAuthenticationService = locator<FirebaseAuthenticationService>();

  void loginWithGoogle() {
    // Uncomment the below
    // _firebaseAuthenticationService.signInWithGoogle();

    // Temporary
    final _navigationServce = locator<NavigationService>();
    _navigationServce.navigateTo(Routes.onboardingView);
  }
}
