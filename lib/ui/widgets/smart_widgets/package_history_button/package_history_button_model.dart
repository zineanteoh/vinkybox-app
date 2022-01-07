import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';

class PackageHistoryButtonModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _deliveryService = locator<DeliveryService>();

  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  void onPress() {
    _navigationService.navigateTo(Routes.myPackagesView);
  }

  final IconData icon = CarbonIcons.recently_viewed;
  final Color iconBgColor = limeGreenColor;
  final String description = "Click to see your past packages!";

  int getMyPackagesCount() {
    return _deliveryService.myPackagesList.length;
  }
}
