import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

// Run the following to regenerate app files:
// flutter pub run build_runner build --delete-conflicting-outputs

/// [AppUser] for modeling a user object within this app
///
/// Accepts parameters [email], [fullName], [dorm] for basic user
/// information.
/// Stores user's [packageSentCount], [packageReceivedCount], and
/// [packageHistory] for user statistics
@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String id,
    String? email,
    String? fullName,
    String? dorm,
    @Default(0) int packageSentCount,
    @Default(0) int packageReceivedCount,
    @Default([]) List<PackageHistoryItem> packageHistory,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

/// [PackageHistoryItem] to represent an archived package delivery for
/// storing user's package history.
///
/// Stores basic package info like [packageSize], [pickUpLocation],
/// [dropOffLocation], and [dateCompleted].
@freezed
class PackageHistoryItem with _$PackageHistoryItem {
  factory PackageHistoryItem({
    required String id,
    required String packageSize,
    required String pickUpLocation,
    required String dropOffLocation,
    required String dateCompleted,
  }) = _PackageHistoryItem;

  factory PackageHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$PackageHistoryItemFromJson(json);
}

/// A [PackageRequest] submitted by user.
///
/// Parameters:
/// [user] who created the request,
/// [status] of request (new, collecting, delivering, or delivered),
/// [packageSize],
/// [pickUpLocation] and [dropOffLocation] specified by user,
/// [time] of when the request was created,
/// [statusAccepted] which stores the deliverer's information (default: empty)
@freezed
class PackageRequest with _$PackageRequest {
  const PackageRequest._();

  factory PackageRequest({
    String? id,
    required Map<String, dynamic> user,
    required String status,
    required String packageSize,
    required String pickUpLocation,
    required String dropOffLocation,
    required String time,
    @Default({}) Map<String, dynamic> statusAccepted,
  }) = _PackageRequest;

  factory PackageRequest.fromJson(Map<String, dynamic> json) =>
      _$PackageRequestFromJson(json);

  factory PackageRequest.fromSnapshot(DocumentSnapshot snapshot) =>
      PackageRequest(
        id: (snapshot.data() as dynamic)['id'],
        user: (snapshot.data() as dynamic)['user'],
        status: (snapshot.data() as dynamic)['status'],
        packageSize: (snapshot.data() as dynamic)['packageSize'],
        pickUpLocation:
            (snapshot.data() as dynamic)['pickUpLocation'],
        dropOffLocation:
            (snapshot.data() as dynamic)['dropOffLocation'],
        time: (snapshot.data() as dynamic)['time'],
        statusAccepted:
            (snapshot.data() as dynamic)['statusAccepted'],
      );
}

/// [PackageRequestList] stores a list of [PackageRequest]
@freezed
class PackageRequestList with _$PackageRequestList {
  factory PackageRequestList({
    @Default([]) List<PackageRequest> requestList,
  }) = _PackageRequestList;

  factory PackageRequestList.fromJson(Map<String, dynamic> json) =>
      _$PackageRequestListFromJson(json);

  /// Parses [QuerySnapshot] into [PackageRequestList]
  ///
  /// Parses [QuerySnapshot] and casts each snapshot docs into a
  /// valid [PackageRequest] model, then converting it into a
  /// [PackageRequestList].
  factory PackageRequestList.fromSnapshot(QuerySnapshot snapshot) {
    return PackageRequestList(
      requestList: snapshot.docs
          .map(
            (doc) => PackageRequest(
              id: (doc.data() as dynamic)['id'],
              user: (doc.data() as dynamic)['user'],
              status: (doc.data() as dynamic)['status'],
              packageSize: (doc.data() as dynamic)['packageSize'],
              pickUpLocation:
                  (doc.data() as dynamic)['pickUpLocation'],
              dropOffLocation:
                  (doc.data() as dynamic)['dropOffLocation'],
              time: (doc.data() as dynamic)['time'],
              statusAccepted:
                  (doc.data() as dynamic)['statusAccepted'],
            ),
          )
          .toList(),
    );
  }
}

/// [AppLocation] to model user's location data
///
/// Parameters:
/// [latitude] and [longitude] of location
@freezed
class AppLocation with _$AppLocation {
  factory AppLocation({
    required String latitude,
    required String longitude,
  }) = _Location;

  factory AppLocation.fromJson(Map<String, dynamic> json) =>
      _$AppLocationFromJson(json);
}
