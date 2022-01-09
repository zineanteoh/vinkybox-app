import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';

class CurrentTaskButtonModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool _pressed = false;
  bool get pressed => _pressed;

  void updatePressedStatus(tapState) {
    _pressed = tapState;
    notifyListeners();
  }

  void onPress() {
    _navigationService.navigateTo(Routes.currentTasksView);
  }

  final IconData icon = CarbonIcons.task;
  final Color iconBgColor = mediumSpringGreenColor;
  final String title = 'Current Tasks';
  final String description = 'See all your current tasks here!';
}
