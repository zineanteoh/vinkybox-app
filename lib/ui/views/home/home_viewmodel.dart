import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/page_controller_service.dart';
import 'package:vinkybox/services/user_service.dart';

class HomeViewModel extends ReactiveViewModel {
  final _pageControllerService = locator<PageControllerService>();
  final _userService = locator<UserService>();

  PageController get pageController =>
      _pageControllerService.pageController;

  void onPageChange(int value) {
    _pageControllerService.setBottomToolbarIndex(value);
  }

  String? getCurrentUserName() {
    return _userService.currentUser.fullName;
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices =>
      [_pageControllerService];
}
