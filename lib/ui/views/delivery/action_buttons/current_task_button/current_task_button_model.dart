import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.router.dart';

class CurrentTaskButtonModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void onPress() {
    _navigationService.navigateTo(Routes.currentTasksView);
  }
}
