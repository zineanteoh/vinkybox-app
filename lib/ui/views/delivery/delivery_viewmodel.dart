import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/app_keys.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/delivery_service.dart';

class DeliveryViewModel extends BaseViewModel {
  final log = getLogger('DeliveryViewModel');
  final _deliveryService = locator<DeliveryService>();

  PackageRequestList get myCurrentPackagesList =>
      _deliveryService.myPackagesList;
  bool get isRequestEmpty =>
      myCurrentPackagesList.requestList.isEmpty;

  // Stream
  late final StreamSubscription _currentRequestListListener;
  late final StreamController<PackageRequestList>
      _currentRequestListController =
      StreamController<PackageRequestList>();
  Stream<PackageRequestList> get currentRequestList =>
      _currentRequestListController.stream;

  void onModelReadyLoad() async {
    await _deliveryService.fetchDeliveryRequestList();
    notifyListeners();
    log.i('fetched delivery request');

    // implement listeners
    _currentRequestListListener = FirebaseFirestore.instance
        .collection(deliveryRequestsFirestoreKey)
        .snapshots()
        .listen(_currentRequestListUpdated);

    // listen to controller changes
    _currentRequestListController.stream
        .listen(_onCurrentRequestListUpdated);
  }

  void _currentRequestListUpdated(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    _currentRequestListController
        .add(PackageRequestList.fromSnapshot(snapshot));
  }

  void _onCurrentRequestListUpdated(PackageRequestList list) {
    _deliveryService.setCurrentTaskList(list);
    notifyListeners();
  }

  int getLatestRequestCount() {
    return myCurrentPackagesList.requestList.length;
  }
}
