import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';

class RequestDeliveryViewModel extends BaseViewModel {
  final log = getLogger("RequestDeliveryViewModel");

  bool _confirmPressed = false;
  bool get confirmPressed => _confirmPressed;

  final _navigationService = locator<NavigationService>();
  final _deliveryService = locator<DeliveryService>();

  late PackageRequest currentRequest;
  String _packageSize = "";
  String _pickUpLocation = "";
  String _dropOffLocation = "";
  String _time = "";

  void updateConfirmPressedStatus(bool tapState) {
    _confirmPressed = tapState;
    notifyListeners();
  }

  void navigateBack() {
    _navigationService.back();
  }

  Future submitRequest(DeliveryViewModel deliveryModel) async {
    // if all selected
    if (_packageSize != "" &&
        _pickUpLocation != "" &&
        _dropOffLocation != "" &&
        _time != "") {
      // Submit to firestore
      log.i("A package request is sent!");
      final result = await _deliveryService.submitNewDeliveryRequest(
          packageSize: _packageSize,
          dropOffLocation: _dropOffLocation,
          pickUpLocation: _pickUpLocation);

      // TODO: dialogservice
      if (result is String) {
        // show error: could not submit package request
        // await _dialogService.showDialog(
        //     title: 'Could not submit delivery request',
        //     description: result,
        // );
      } else {
        // show success
        // await _dialogService.showDialog(
        //   title: 'Success',
        //   description: 'Your delivery request has been created',
        // );
      }

      // Navigate back
      navigateBack();

      // refresh delivery view
      deliveryModel.onRefresh();
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
