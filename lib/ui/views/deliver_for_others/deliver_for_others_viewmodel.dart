import 'dart:async';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/delivery_service.dart';

class DeliverForOthersViewModel extends BaseViewModel {
  final log = getLogger('DeliverForOthersViewModel');
  final _deliveryService = locator<DeliveryService>();

  RefreshController get refreshController => _refreshController;

  PackageRequestList get latestRequestList =>
      _deliveryService.latestRequestList;
  bool get isRequestEmpty => latestRequestList.requestList.isEmpty;

  final String deliveryPersonAsset =
      "assets/images/delivery-person.svg";

  bool _cardPressed = false;
  bool get cardPressed => _cardPressed;

  void updateCardPressedStatus(tapStatus) {
    _cardPressed = tapStatus;
    notifyListeners();
  }

  void onModelReadyLoad() async {
    await _deliveryService.fetchDeliveryRequestList();
    notifyListeners();
  }

  // Pull_to_refresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future loadLatestRequests() async {
    setBusy(true);
    await Future.delayed(const Duration(milliseconds: 1000));
    await _deliveryService.fetchDeliveryRequestList();
    setBusy(false);
    notifyListeners();
  }

  Future onRefresh() async {
    setBusy(true);
    await Future.delayed(const Duration(milliseconds: 1000));
    await _deliveryService.fetchDeliveryRequestList();
    setBusy(false);
    notifyListeners();
    _refreshController.refreshCompleted();
  }

  int getLatestRequestCount() {
    return latestRequestList.requestList.length;
  }
}
