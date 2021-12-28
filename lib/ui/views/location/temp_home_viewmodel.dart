import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';

class TempHomeViewModel extends BaseViewModel {
  //
  final _navigationService = locator<NavigationService>();

  void navigate() {
    _navigationService.navigateTo(Routes.locationView);
  }
}
