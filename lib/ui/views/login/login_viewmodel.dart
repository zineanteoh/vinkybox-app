import 'dart:ffi';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/api/firestore_api.dart';
// import 'package:stacked_services/stacked_services.dart';
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

  void loginWithGoogle() async {
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

  // TEMPORARY -- loging in as user
  void temporaryLogin(int i) async {
    String tempEmail;
    String tempId;
    String tempDorm;
    if (i == 1) {
      tempId = "00001";
      tempEmail = "phoebe.yu@vanderbilt.edu";
      tempDorm = "Sutherland";
    } else if (i == 2) {
      tempId = "00002";
      tempEmail = "jane.sun@vanderbilt.edu";
      tempDorm = "Sutherland";
    } else {
      tempId = "00003";
      tempEmail = "zi.nean.teoh@vanderbilt.edu";
      tempDorm = "West";
    }

    // Check if user in firestore (SUPER BRUTEFORCE)
    final _firestoreApi = locator<FirestoreApi>();
    final _navigationService = locator<NavigationService>();
    AppUser userr = AppUser(id: "0", fullName: "doesn't exist");
    await _firestoreApi.getUser(userId: tempId).then((AppUser? user) {
      userr = user!;
      _userService.setCurrentUser(user);
    }).catchError((onError) {
      _userService.setCurrentUser(AppUser(
        id: tempId,
        email: tempEmail,
        fullName: getFullNameFromEmail(tempEmail),
      ));
      _navigationService.navigateTo(Routes.onboardingView);
    });

    // await _userService.submitCurrentUserDorm(userDorm: _userDorm);

    if (userr.id == "0") {
      _navigationService.navigateTo(Routes.onboardingView);
    } else {
      _navigationService.navigateTo(Routes.homeView);
    }
  }
}
