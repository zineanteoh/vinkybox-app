import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/app_keys.dart';
import 'package:vinkybox/exceptions/firestore_api_exception.dart';
import 'package:vinkybox/models/application_models.dart';

/// Performs APIs relating to Cloud Firestore's NoSQL database
///
/// Functionality:
/// - Add/update [usersFirestoreKey] collection
/// - Send/retrieve/update [deliveryRequestsFirestoreKey] collection
class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection(usersFirestoreKey);

  final CollectionReference _deliveryRequestsCollection =
      FirebaseFirestore.instance
          .collection(deliveryRequestsFirestoreKey);

  /// Creates a user in Firestore given an [AppUser] document
  ///
  /// If successful, log user created
  ///
  /// Otherwise, log user creation attempt failed
  Future<void> createUser({required AppUser user}) async {
    log.i('user:$user');

    try {
      final userDocument = _usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  /// Returns an [AppUser] from firestore given a [userId]
  ///
  /// If userId is valid and queried userDoc exists, return the
  /// user data as [AppUser]
  ///
  /// Otherwise return null or throw exception if userId is empty
  Future<AppUser?> getUser({required String userId}) async {
    log.i('userId:$userId');

    if (userId.isNotEmpty) {
      final userDoc = await _usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      log.v('User found. Data: $userData');

      return AppUser.fromJson(userData);
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.');
    }
  }

  /// Creates a delivery request in firestore given a valid
  /// [PackageRequest] documnet
  ///
  /// If successful, log delivery request created
  ///
  /// Otherwise, log failure and throw exception
  Future<void> createDeliveryRequest(
      {required PackageRequest req}) async {
    log.i('package request: $req');

    try {
      late String requestId;
      await _deliveryRequestsCollection
          .add(req.toJson())
          .then((value) {
        requestId = value.id;
        return value.update({'id': value.id});
      });
      log.v('PackageRequest created at ${requestId}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new delivery request',
        devDetails: '$error',
      );
    }
  }

  /// Fetches delivery request list from firestore and returns
  /// a list of delivery requests
  ///
  /// Request is limited by 20 and ordered by time ascending
  ///
  /// Each delivery requests includes an 'id' field that is the
  /// delivery id.
  Future<PackageRequestList> fetchDeliveryRequestList() async {
    List<PackageRequest> deliveryRequests = [];
    try {
      deliveryRequests = await _deliveryRequestsCollection
          .limit(20)
          .orderBy('time', descending: false)
          .get()
          .then(
        (QuerySnapshot querySnapshot) {
          for (QueryDocumentSnapshot doc in querySnapshot.docs) {
            // add delivery doc id to request map
            Map<String, dynamic> request =
                doc.data() as Map<String, dynamic>;
            request['id'] = doc.id;
            log.i('this is request json: $request');
            deliveryRequests.add(PackageRequest.fromJson(request));
          }
          return deliveryRequests;
        },
      );
    } catch (e) {
      log.e(
          "An error occurred. Could not fetch delivery request list: ${e.toString()}");
    }
    return PackageRequestList(requestList: deliveryRequests);
  }

  /// Adds [acceptRequestInfo] to [deliveryId] document to the
  /// firestore, and updates delivery status to [newStatus]
  /// if successful.
  ///
  /// Uses firestore [WriteBatch] to perform the writes as a
  /// single operation.
  ///
  /// If unsuccessful, log the error.
  Future acceptDeliveryRequest(
      String deliveryId,
      Map<String, dynamic> acceptRequestInfo,
      String newStatus) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    try {
      batch.update(_deliveryRequestsCollection.doc(deliveryId),
          acceptRequestInfo);
      batch.update(_deliveryRequestsCollection.doc(deliveryId),
          {'status': newStatus});

      await batch.commit();
    } catch (e) {
      log.e('An error occurred. Could not accept delivery request');
    }
  }

  /// Adds the [pickUpRequestInfo] to [deliveryId] document
  /// and update delivery status to [newStatus] if successful.
  ///
  /// Uses firestore [WriteBatch] to perform the writes as a
  /// single operation.
  ///
  /// If unsuccessful, log the error.
  Future pickUpDeliveryRequest(
      String deliveryId,
      Map<String, dynamic> pickUpRequestInfo,
      String newStatus) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    try {
      batch.update(_deliveryRequestsCollection.doc(deliveryId),
          pickUpRequestInfo);
      batch.update(_deliveryRequestsCollection.doc(deliveryId),
          {'status': newStatus});

      await batch.commit();
    } catch (e) {
      log.e('An error occurred. Could not pick up delivery request');
    }
  }

  /// Update delivery request to [newStatus] to mark as completed
  Future completeDeliveryRequest(String deliveryId, String newStatus,
      PackageRequest deliveryrequest) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    try {
      // update new status
      batch.update(_deliveryRequestsCollection.doc(deliveryId),
          {'status': newStatus});
      // convert to deliveryHistoryItem and add to user's packageHistory

    } catch (e) {
      log.e('An error occurred. Could not pick up delivery request');
    }
  }
}
