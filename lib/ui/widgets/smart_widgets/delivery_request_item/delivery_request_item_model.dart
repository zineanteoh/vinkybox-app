import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/constants/app_keys.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/services/user_service.dart';

class DeliveryRequestItemModel extends BaseViewModel {
  final log = getLogger('DeliveryRequestItemModel');

  final _userService = locator<UserService>();
  final _deliveryService = locator<DeliveryService>();
  final _navigationService = locator<NavigationService>();

  bool _pressed = false;
  bool get pressed => _pressed;

  bool _cancelPressed = false;
  bool get cancelPressed => _cancelPressed;

  bool _acceptPressed = false;
  bool get acceptPressed => _acceptPressed;

  bool _trackPackagePressed = false;
  bool get trackPackagePressed => _trackPackagePressed;

  bool _userTaskActionPressed = false;
  bool get userTaskActionPressed => _userTaskActionPressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  void updateCancelPressedStatus(tapState) {
    _cancelPressed = tapState;
    notifyListeners();
  }

  void updateAcceptPressedStatus(tapState) {
    _acceptPressed = tapState;
    notifyListeners();
  }

  void updateTrackPackagePressedStatus(tapState) {
    _trackPackagePressed = tapState;
    notifyListeners();
  }

  void updateUserTaskActionPressedStatus(tapState) {
    _userTaskActionPressed = tapState;
    notifyListeners();
  }

  late PackageRequest _deliveryRequest;
  late dynamic _deliveryId;
  late String nameInfo;
  late String timeInfo;
  late String statusInfo;
  late String dormInfo;
  late String packageSizeInfo;
  late String pickUpLocationInfo;
  late String dropOffLocationInfo;
  late String delivererNameInfo;

  late final StreamSubscription _requestItemListener;
  late final StreamController<PackageRequest> _requestItemController =
      StreamController<PackageRequest>();
  Stream<PackageRequest> get requestItem =>
      _requestItemController.stream;

  @override
  void dispose() {
    _requestItemListener.cancel();
    _requestItemController.close();
    super.dispose();
  }

  void onModelReadyLoad(PackageRequest request) {
    _deliveryRequest = request;
    _deliveryId = request.id;
    nameInfo = request.user['fullName'];
    timeInfo = request.time;
    statusInfo = request.status;
    dormInfo = request.user['dorm'];
    packageSizeInfo = request.packageSize;
    pickUpLocationInfo = request.pickUpLocation;
    dropOffLocationInfo = request.dropOffLocation;
    if (statusInfo != deliveryStatus[0]) {
      // if delivery status is not new
      delivererNameInfo =
          request.statusAccepted['deliverer']['fullName'];
    }

    // implement listeners
    _requestItemListener = FirebaseFirestore.instance
        .collection(deliveryRequestsFirestoreKey)
        .doc(_deliveryId)
        .snapshots()
        .listen(_requestUpdated); // add snapshot to controller

    // listen to controller changes
    _requestItemController.stream.listen(_onRequestUpdated);
  }

  void _requestUpdated(DocumentSnapshot snapshot) {
    _requestItemController.add(PackageRequest.fromSnapshot(snapshot));
  }

  void _onRequestUpdated(PackageRequest item) {
    statusInfo = item.status;
    notifyListeners();
  }

  bool isMyPackage() {
    return _deliveryRequest.user['email'] ==
        _userService.currentUser.email;
  }

  bool statusIsNotNew() {
    return statusInfo != deliveryStatus[0];
  }

  Future acceptRequest() async {
    await _deliveryService.acceptRequest(_deliveryId);
    notifyListeners();
  }

  Future pickUpRequest() async {
    log.i(
        'Package is being picked up! Updating package request to delivering');
    await _deliveryService.pickUpRequest(_deliveryId);
    // log.i(
    //     'IsUserDelivering is now: ${_deliveryService.isUserDelivering}');
    // enable location tracking
    notifyListeners();
  }

  void trackPackage() {
    log.i(
        'Navigating to Location View with deliveryId = $_deliveryId');
    _navigationService.navigateTo(Routes.locationView,
        arguments: LocationViewArguments(
            deliveryId: _deliveryId, isDelivering: false));
  }
}
