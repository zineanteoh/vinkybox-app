import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/app_keys.dart';
import 'package:vinkybox/exceptions/firestore_api_exception.dart';
import 'package:vinkybox/models/app_user.dart';

// Performs APIs relating to Cloud Firestore NoSQL database
// ... add user info to collection
// ... send & retrieve delivery requests
class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection(UsersFirestoreKey);

  final CollectionReference deliveryRequestsCollection =
      FirebaseFirestore.instance
          .collection(DeliveryRequestsFirestoreKey);

  /// createUser adds an AppUser document to collection
  Future<void> createUser(AppUser user) async {
    log.i('user:$user');

    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  /// getUser returns an AppUser from firestore
  Future<AppUser?> getUser({required String userId}) async {
    log.i('userId:$userId');

    if (userId.isNotEmpty) {
      final userDoc = await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      log.v('User found. Data: $userData');

      return AppUser.fromData(userData);
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.');
    }
  }

  /// addNewDeliveryRequest
}
