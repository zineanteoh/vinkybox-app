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

  // Pull_to_refresh
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  void navigateBack() {
    _navigationService.back();
  }
}
