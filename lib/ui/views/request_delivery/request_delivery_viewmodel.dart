import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/models/package_request.dart';
import 'package:vinkybox/services/user_service.dart';

class RequestDeliveryViewModel extends BaseViewModel {
  final log = getLogger("RequestDeliveryViewModel");

  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  late PackageRequest currentRequest;
  String _packageSize = "";
  String _pickUpLocation = "";
  String _dropOffLocation = "";
  String _time = "";

  void navigateBack() {
    _navigationService.back();
  }

  void submitRequest() {
    // if all selected
    if (_packageSize != "" &&
        _pickUpLocation != "" &&
        _dropOffLocation != "" &&
        _time != "") {
      // Submit to firestore
      log.i("A package request is sent!");
      final email = _userService.currentUser.email;
    } else {
      log.e("Request did not go through!");
    }
  }

  void selectPackageSize(index) {
    _packageSize = requestPackageSize[index];
    log.i("Package size: $_packageSize");
  }

  void selectPickUpLocation(index) {
    _pickUpLocation = requestPickUpLocation[index];
    log.i("Pick up: $_pickUpLocation");
  }

  void selectDropOffLocation(index) {
    _dropOffLocation = requestDropOffLocation[index];
    log.i("Drop off: $_dropOffLocation");
  }

  void selectTime(index) {
    _time = requestTime[index];
    log.i("Time: $_time");
  }
}
