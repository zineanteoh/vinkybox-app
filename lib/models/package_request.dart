import 'package:vinkybox/models/app_user.dart';

class PackageRequest {
  final String packageSize;
  final String pickUpLocation;
  final String dropOffLocation;
  final String time;
  final AppUser user;

  PackageRequest(
    this.packageSize,
    this.pickUpLocation,
    this.dropOffLocation,
    this.time,
    this.user,
  );
}
