import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/api/firestore_api.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';

class LatestRequestsViewModel extends BaseViewModel {
  final log = getLogger("LatestRequestsViewModel");

  List<dynamic> _deliveryRequestList = [];
  get deliveryRequestList => _deliveryRequestList;

  final _navigationService = locator<NavigationService>();
  final _firestoreApi = locator<FirestoreApi>();

  void navigateBack() {
    _navigationService.back();
  }

  // Pull_to_refresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  Future loadLatestRequests() async {
    setBusy(true);
    await Future.delayed(const Duration(milliseconds: 1000));
    _deliveryRequestList =
        await _firestoreApi.fetchDeliveryRequestList();
    notifyListeners();
    setBusy(false);
  }

  Future onRefresh() async {
    // monitor network fetch
    loadLatestRequests();
    await Future.delayed(const Duration(milliseconds: 750));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // add data here
    // items.add((items.length + 1).toString());
    // if (mounted) setState(() {});
    _refreshController.loadComplete();
  }
}
