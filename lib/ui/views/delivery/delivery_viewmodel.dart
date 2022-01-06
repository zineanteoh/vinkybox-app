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

  List<dynamic> get latestRequestList =>
      _deliveryService.latestRequestList;

  bool get isRequestEmpty => latestRequestList.isEmpty;

  Future loadLatestRequests() async {
    setBusy(true);
    log.i('loading latest requests...');
    await _deliveryService.fetchDeliveryRequestList();
    await Future.delayed(const Duration(milliseconds: 700));
    notifyListeners();
    setBusy(false);
    _refreshController.refreshCompleted();
  }

  int getLatestRequestCount() {
    return latestRequestList.length;
  }
}
