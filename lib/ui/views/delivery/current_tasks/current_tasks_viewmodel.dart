import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/delivery_service.dart';

class CurrentTasksViewModel extends BaseViewModel {
  final log = getLogger('CurrentDeliveryViewModel');

  final _deliveryService = locator<DeliveryService>();
  final _navigationService = locator<NavigationService>();

  PackageRequestList get currentTasksList =>
      _deliveryService.currentTasksList;
  bool get isCurrentTasksEmpty =>
      currentTasksList.requestList.isEmpty;

  // Pull_to_refresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  void navigateBack() {
    _navigationService.back();
  }

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
    // if failed,use refreshFailed()
    setBusy(false);
    notifyListeners(); // need to also notify listeners for child widgets
    _refreshController.refreshCompleted();
  }

  int getCurrentTasksCount() {
    return currentTasksList.requestList.length;
  }
}
