import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';

class RequestDeliveryButtonModel extends BaseViewModel {
  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  final IconData icon = CarbonIcons.delivery_parcel;
  final Color iconBgColor = skyblueHex;
  final String title = "Request Delivery";
  final String description = "Too busy? Let others deliver for you!";
}
