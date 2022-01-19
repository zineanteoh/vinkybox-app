import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/helpers/enum_parser.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';

enum RequestDeliveryStage { selectingSize, selectingLocation }

class RequestDeliveryViewModel extends BaseViewModel {
  final log = getLogger("RequestDeliveryViewModel");

  bool _confirmPressed = false;
  bool get confirmPressed => _confirmPressed;

  final _navigationService = locator<NavigationService>();
  final _deliveryService = locator<DeliveryService>();

  late PackageRequest currentRequest;
  String _pickUpLocation = "";
  String _dropOffLocation = "";

  RequestDeliveryStage _currentStage =
      RequestDeliveryStage.selectingSize;
  RequestDeliveryStage get currentStage => _currentStage;

  PackageSize _packageSize = PackageSize.None;
  PackageSize get currentSize => _packageSize;

  void setCurrentSize(PackageSize? size) {
    if (size != null) {
      _packageSize = size;
      notifyListeners();
    }
  }

  void updateConfirmPressedStatus(bool tapState) {
    _confirmPressed = tapState;
    notifyListeners();
  }

  void navigateBack({isGoingHome = false}) {
    if (!isGoingHome &&
        _currentStage == RequestDeliveryStage.selectingLocation) {
      _currentStage = RequestDeliveryStage.selectingSize;
      notifyListeners();
    } else {
      _navigationService.back();
    }
  }

  void nextStage() {
    if (_packageSize != PackageSize.None) {
      _currentStage = RequestDeliveryStage.selectingLocation;
      notifyListeners();
    }
  }

  Future submitRequest(DeliveryViewModel deliveryModel) async {
    // if all selected
    if (_packageSize != PackageSize.None &&
        _pickUpLocation != "" &&
        _dropOffLocation != "") {
      // Submit to firestore
      log.i("A package request is sent!");
      final result = await _deliveryService.submitNewDeliveryRequest(
          packageSize: parsePackageSize(_packageSize),
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
      navigateBack(isGoingHome: true);

      // refresh delivery view
      deliveryModel.onRefresh();
    } else {
      log.e("Request did not go through!");
    }
  }

  // void selectPackageSize(index) {
  //   _packageSize = requestPackageSize[index];
  //   log.i("Package size: $_packageSize");
  // }

  void selectPickUpLocation(index) {
    _pickUpLocation = requestPickUpLocation[index];
    log.i("Pick up: $_pickUpLocation");
  }

  void selectDropOffLocation(index) {
    _dropOffLocation = requestDropOffLocation[index];
    log.i("Drop off: $_dropOffLocation");
  }
}
