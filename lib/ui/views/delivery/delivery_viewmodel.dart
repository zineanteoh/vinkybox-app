import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/delivery_service.dart';

class DeliveryViewModel extends BaseViewModel {
  final log = getLogger('DeliveryViewModel');
  final _deliveryService = locator<DeliveryService>();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  List<dynamic> get myCurrentPackagesList =>
      _deliveryService.myPackagesList;

  bool get isRequestEmpty => myCurrentPackagesList.isEmpty;

  Future loadLatestRequests() async {
    setBusy(true);
    log.i('loading latest requests...');
    await Future.delayed(const Duration(milliseconds: 700));
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
    return myCurrentPackagesList.length;
  }
}
