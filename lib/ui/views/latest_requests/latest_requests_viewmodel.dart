import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/delivery_service.dart';

class LatestRequestsViewModel extends BaseViewModel {
  final log = getLogger("LatestRequestsViewModel");
  final _navigationService = locator<NavigationService>();
  final _deliveryService = locator<DeliveryService>();

  get deliveryRequestList => _deliveryService.deliveryRequestList;

  void navigateBack() {
    _navigationService.back();
  }

  // Pull_to_refresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  Future loadLatestRequests() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _deliveryService.fetchDeliveryRequestList();
    notifyListeners();
  }

  Future onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _deliveryService.fetchDeliveryRequestList();
    notifyListeners();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  // // loading is used to load for more data as user scrolls down
  // void onLoading() async {
  //   // monitor network fetch
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   // if failed,use loadFailed(),if no data return,use LoadNodata()
  //   // add data here
  //   // items.add((items.length + 1).toString());
  //   // if (mounted) setState(() {});
  //   _refreshController.loadComplete();
  // }
}
