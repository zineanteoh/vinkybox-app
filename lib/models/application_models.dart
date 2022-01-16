import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

// Run the following to regenerate app files:
// flutter pub run build_runner build --delete-conflicting-outputs

@freezed
class AppUser with _$AppUser {
  factory AppUser({
    required String id,
    String? email,
    String? fullName,
    String? dorm,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

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

@freezed
class PackageRequestList with _$PackageRequestList {
  factory PackageRequestList({
    @Default([]) List<PackageRequest> requestList,
  }) = _PackageRequestList;

  factory PackageRequestList.fromJson(Map<String, dynamic> json) =>
      _$PackageRequestListFromJson(json);

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

@freezed
class AppLocation with _$AppLocation {
  factory AppLocation({
    required String latitude,
    required String longitude,
  }) = _Location;

  factory AppLocation.fromJson(Map<String, dynamic> json) =>
      _$AppLocationFromJson(json);
}
