import 'package:vinkybox/constants/request_info.dart';

String parsePackageSize(PackageSize size) {
  switch (size) {
    case PackageSize.Small:
      return "Small";

    case PackageSize.Medium:
      return "Medium";

    case PackageSize.Large:
      return "Large";

    case PackageSize.Other:
      return "Other";

    default:
      return "None";
  }
}
