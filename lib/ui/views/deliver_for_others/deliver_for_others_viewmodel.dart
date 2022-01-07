import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/services/location_service.dart';

class DeliverForOthersViewModel extends BaseViewModel {
  final log = getLogger('DeliverForOthersViewModel');
  final _deliveryService = locator<DeliveryService>();
  final _navigationService = locator<NavigationService>();
  final _locationService = locator<LocationService>();

  List<dynamic> get latestRequestList =>
      _deliveryService.latestRequestList;

  bool get isRequestEmpty => latestRequestList.isEmpty;

  void navigateToCurrentDeliveryView() {
    _locationService.setIsDeliverying(true);
    _navigationService.navigateTo(Routes.currentDeliveryView);
  }

  void navigateToLocationView() {
    _locationService.setIsDeliverying(false);
    _navigationService.navigateTo(Routes.locationView);
  }

  int getLatestRequestCount() {
    return latestRequestList.length;
  }
}
