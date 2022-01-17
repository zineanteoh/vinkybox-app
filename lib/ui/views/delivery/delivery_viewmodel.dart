import 'dart:async';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/delivery_service.dart';

class DeliveryViewModel extends BaseViewModel {
  final log = getLogger('DeliveryViewModel');
  final _deliveryService = locator<DeliveryService>();

  PackageRequestList get myCurrentPackagesList =>
      _deliveryService.myPackagesList;
  bool get isRequestEmpty =>
      myCurrentPackagesList.requestList.isEmpty;

  // Refresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  Future onRefresh() async {
    setBusy(true);
    await Future.delayed(const Duration(milliseconds: 1000));
    await _deliveryService.fetchDeliveryRequestList();
    setBusy(false);
    notifyListeners();
    _refreshController.refreshCompleted();
  }

  int getLatestRequestCount() {
    return myCurrentPackagesList.requestList.length;
  }
}
