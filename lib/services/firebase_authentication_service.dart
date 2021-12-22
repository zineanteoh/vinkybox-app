import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/models/application_models.dart';
// import 'package:vinkybox/models/application_models.dart';

// Performs Google_Sign_In authentication with Firebase here
class FirebaseAuthenticationService {
  final log = getLogger('FirebaseAuthenticationService');

  final _googleSignIn = GoogleSignIn();

  final _firestoreApi = locator<FirestoreApi>();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseAuthenticationResult> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser =
          await _googleSignIn.signIn();

      if (googleUser == null) {
        log.i('Process is canceled by the user');
        return FirebaseAuthenticationResult.error(
            errorMessage:
                'Google Sign In has been cancelled by the user');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleSignInAuth =
          await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );

      // Once signed in, store the UserCredential
      final result =
          await firebaseAuth.signInWithCredential(credential);

      // Add user to Cloud Firestore
      _firestoreApi.createUser(
        user: AppUser(
          id: result.user!.uid,
          email: result.user!.email,
        ),
      );

      // Return result
      return FirebaseAuthenticationResult(user: result.user);
    } catch (e) {
      log.e(e);
      return FirebaseAuthenticationResult.error(
          errorMessage: e.toString());
    }
  }

  /// Returns the current loggedin Firebase User
  User? get currentUser {
    return firebaseAuth.currentUser;
  }
}

class FirebaseAuthenticationResult {
  /// Firebase user
  final User? user;

  /// Contains the error message for the request
  final String? errorMessage;
  final String? exceptionCode;

  FirebaseAuthenticationResult({this.user})
      : errorMessage = null,
        exceptionCode = null;

  FirebaseAuthenticationResult.error(
      {this.errorMessage, this.exceptionCode})
      : user = null;

  /// Returns true if the response has an error associated with it
  bool get hasError =>
      errorMessage != null && errorMessage!.isNotEmpty;
}
