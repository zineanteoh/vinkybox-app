// import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/helpers/email_parser.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/firebase_authentication_service.dart';

// Performs services relating to AppUser using FirestoreApi
// ... create a new user in Firestore users collection
class UserService {
  final log = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  AppUser? _currentUser;
  AppUser get currentUser => _currentUser!;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.currentUser!.uid;

    log.v('Sync user $firebaseUserId');

    final userAccount =
        await _firestoreApi.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      log.v('Account exists. Save as _currentUser');
      _currentUser = userAccount;
    }
  }

  Future<void> syncOrCreateUserAccount(
      {required AppUser user}) async {
    log.i('user: $user');

    await syncUserAccount();

    if (_currentUser == null) {
      log.v('We have no user account. Create a new user...');
      await _firestoreApi.createUser(user: user);
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }

  // TODO: temporarily set to false (startup_viewmodel)
  bool get hasLoggedInUser =>
      false; // _firebaseAuthenticationService.currentUser == null;

  void setCurrentUser(AppUser user) {
    log.v('Current user on file: $user');
    _currentUser = user;
  }

  Future submitCurrentUserDorm({required String userDorm}) async {
    _currentUser = _currentUser!.copyWith(dorm: userDorm);
    log.v('Dorm updated. Current User on file: $_currentUser');
    await _firestoreApi.createUser(user: _currentUser!);
  }

  Future submitNewDeliveryRequest(
      {required String packageSize,
      required String pickUpLocation,
      required String dropOffLocation}) async {
    await _firestoreApi.createDeliveryRequest(
      req: PackageRequest(
          user: _currentUser!.toJson(),
          status: "New",
          packageSize: packageSize,
          pickUpLocation: pickUpLocation,
          dropOffLocation: dropOffLocation,
          time: DateTime.now().toString()),
    );
    log.v('Package has been requested!');
  }
  //   setCurrentUser(myAppUser);
  //   _firestoreApi.createUser(_currentUser!);
  // }

  // void setCurrentUser(User user) {
  //   _currentUser = user;
  // }

  // bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  // Future<void> syncUserAccount() async {
  //   final firebaseUserId =
  //       _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

  //   log.v('Sync user $firebaseUserId');

  //   final userAccount =
  //       await _firestoreApi.getUser(userId: firebaseUserId);

  //   if (userAccount != null) {
  //     log.v('User account exists. Save as _currentUser');
  //     _currentUser = userAccount as User?;
  //   }
  // }

  // Future<void> syncOrCreateUserAccount({required User user}) async {
  //   log.i('user:$user');

  //   await syncUserAccount();

  //   if (_currentUser == null) {
  //     log.v('We have no user account. Create a new user ...');
  //     await _firestoreApi.createUser(user: user);
  //     _currentUser = user;
  //     log.v('_currentUser has been saved');
  //   }
  // }
}
