import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/delivery_service.dart';

class MyPackagesViewModel extends BaseViewModel {
  final log = getLogger("MyPackagesViewModel");

  final _navigationService = locator<NavigationService>();
  final _deliveryService = locator<DeliveryService>();

  List<dynamic> get myPackagesList => _deliveryService.myPackagesList;

  bool get myPackagesIsEmpty => myPackagesList.isEmpty;

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
    _deliveryService.fetchDeliveryRequestList();
    notifyListeners();
    setBusy(false);
  }

  Future onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _deliveryService.updateMyPackagesList();
    notifyListeners();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
