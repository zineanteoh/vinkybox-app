import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  // final introKey = GlobalKey<IntroductionScreenState>();
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  void onIntroEnd() {
    _navigationService.navigateTo(Routes.dormSelectionView);
  }

  Widget buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }
}
