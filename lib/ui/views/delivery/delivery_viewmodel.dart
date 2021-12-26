import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/delivery_service.dart';

class DeliveryViewModel extends BaseViewModel {
  // share
  final _deliveryService = locator<DeliveryService>();

  List<dynamic> get deliveryRequestList =>
      _deliveryService.deliveryRequestList;

  Future loadLatestRequests() async {
    setBusy(true);
    await Future.delayed(const Duration(milliseconds: 1000));
    _deliveryService.fetchDeliveryRequestList();
    notifyListeners();
    setBusy(false);
  }
}
