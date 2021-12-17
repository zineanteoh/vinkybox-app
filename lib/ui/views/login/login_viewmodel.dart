import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/firebase_authentication_service.dart';

class LoginViewModel extends BaseViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  void loginWithGoogle() {
    _firebaseAuthenticationService.signInWithGoogle();
  }
}
