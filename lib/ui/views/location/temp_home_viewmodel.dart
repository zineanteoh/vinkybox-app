import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/services/location_service.dart';

class TempHomeViewModel extends BaseViewModel {
  //
  final _navigationService = locator<NavigationService>();
  final _locationService = locator<LocationService>();

  void navigate() {
    _navigationService.navigateTo(Routes.locationView);
  }

  void initializeLocationService() {
    _locationService.initializeLocationService();
  }
}
