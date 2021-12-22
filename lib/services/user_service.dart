// import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/helpers/email_parser.dart';
import 'package:vinkybox/models/application_models.dart';
// import 'package:vinkybox/models/application_models.dart';

// Performs services relating to AppUser using FirestoreApi
// ... create a new user in Firestore users collection
class UserService {
  final log = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();

  Future<void> syncUserAccount() async {}
  Future<void> syncOrCreateUserAccount() async {}

  // User? _currentUser;

  // User get currentUser => _currentUser!;

  late AppUser _currentUser;

  AppUser get currentUser => _currentUser;

  bool get hasLoggedInUser => false;

  void setCurrentUser(AppUser user) {
    _currentUser = user;
  }

  void createUserInFirestore({required String userDorm}) {
    // TODO: get id and email from firebase auth result
    // get full name from email

    // Dummy data:
    var id = '1234';
    var email = 'zi.nean.teoh@vanderbilt.edu';
    var fullName = getFullNameFromEmail(email);
    var myAppUser = AppUser(
      id: id,
      fullName: fullName,
      email: email,
      dorm: userDorm,
    );

    setCurrentUser(myAppUser);
    _firestoreApi.createUser(_currentUser);
  }

  void submitDeliveryRequest() {}

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
