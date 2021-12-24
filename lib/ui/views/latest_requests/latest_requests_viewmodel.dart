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
}
