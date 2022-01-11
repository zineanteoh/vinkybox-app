import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  RefreshController get refreshController => _refreshController;

  List<dynamic> get latestRequestList =>
      _deliveryService.latestRequestList;
  bool get isRequestEmpty => latestRequestList.isEmpty;

  final String deliveryPersonAsset =
      "assets/images/delivery-person.svg";

  bool _cardPressed = false;
  bool get cardPressed => _cardPressed;

  void updateCardPressedStatus(tapStatus) {
    _cardPressed = tapStatus;
    notifyListeners();
  }

  // Pull_to_refresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future loadLatestRequests() async {
    setBusy(true);
    await Future.delayed(const Duration(milliseconds: 1000));
    _deliveryService.fetchDeliveryRequestList();
    setBusy(false);
    notifyListeners();
  }

  Future onRefresh() async {
    setBusy(true);
    await Future.delayed(const Duration(milliseconds: 1000));
    _deliveryService.fetchDeliveryRequestList();
    setBusy(false);
    notifyListeners();
    _refreshController.refreshCompleted();
  }

  int getLatestRequestCount() {
    return latestRequestList.length;
  }
}
