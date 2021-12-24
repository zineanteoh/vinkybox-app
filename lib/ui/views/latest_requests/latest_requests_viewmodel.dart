import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';

class LatestRequestsViewModel extends BaseViewModel {
  final log = getLogger("LatestRequestsViewModel");

  final _navigationService = locator<NavigationService>();

  void navigateBack() {
    _navigationService.back();
  }

  // Pull_to_refresh

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
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
