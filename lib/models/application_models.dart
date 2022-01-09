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
  factory PackageRequest({
    required Map<String, dynamic> user,
    String? status,
    required String packageSize,
    required String pickUpLocation,
    required String dropOffLocation,
    required String time,
    @Default({}) Map<String, dynamic> statusAccepted,
  }) = _PackageRequest;

  factory PackageRequest.fromJson(Map<String, dynamic> json) =>
      _$PackageRequestFromJson(json);
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
