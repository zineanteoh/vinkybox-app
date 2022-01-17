import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';

class RequestDeliveryButtonModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  // deliveryModel is used to enable auto-refresh when request goes through
  late final DeliveryViewModel deliveryModel;

  void initialize(DeliveryViewModel model) {
    deliveryModel = model;
  }

  void onPress() {
    _navigationService.navigateTo(Routes.requestDeliveryView,
        arguments: RequestDeliveryViewArguments(
            deliveryModel: deliveryModel));
  }

  final IconData icon = CarbonIcons.delivery_parcel;
  final Color iconBgColor = blueJeansColorHex;
  final String title = "Request Delivery";
  final String description = "Too busy? Let others deliver for you!";
}
