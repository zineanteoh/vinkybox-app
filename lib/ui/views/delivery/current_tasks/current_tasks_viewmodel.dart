import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/delivery_service.dart';

class CurrentTasksViewModel extends BaseViewModel {
  final log = getLogger('CurrentDeliveryViewModel');

  final _deliveryService = locator<DeliveryService>();

  List<dynamic> get currentTasksList =>
      _deliveryService.currentTasksList;

  int getCurrentTasksCount() {
    return currentTasksList.length;
  }
}
