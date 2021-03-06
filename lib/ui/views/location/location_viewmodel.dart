import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/constants/marker_locations.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/services/delivery_service.dart';
import 'package:vinkybox/services/google_map_service.dart';
import 'package:vinkybox/services/location_tracking_service.dart';
import 'package:vinkybox/services/package_tracking_service.dart';

class LocationViewModel extends BaseViewModel {
  final log = getLogger('LocationViewModel');

  final _googleMapService = locator<GoogleMapService>();
  final _deliveryService = locator<DeliveryService>();
  final _locationTrackingService = locator<LocationTrackingService>();
  final _packageTrackingService = locator<PackageTrackingService>();

  bool get isMapCreated => _googleMapService.isMapCreated;

  GoogleMapController get controller => _googleMapService.controller;

  CameraPosition get initialCameraPosition =>
      _googleMapService.initialCameraPosition;

  Set<Marker> get markers => _googleMapService.markers;

  Future init() async {
    log.i('Initializing location view model');
    List<Map<String, dynamic>> dropOffMarkerLocations = [];
    for (PackageRequest task
        in _deliveryService.currentTasksList.requestList) {
      Map<String, double> coor = dropOffLocations[task.user['dorm']]!;
      Map<String, dynamic> loc = {
        'name': task.user['dorm'],
        'longitude': coor['longitude'],
        'latitude': coor['latitude'],
      };
      log.i('location is: $loc');
      // loc['name'] = task.user['dorm'];
      dropOffMarkerLocations.add(loc);
    }
    await _googleMapService.init(dropOffMarkerLocations);
  }

  void onMapCreated(GoogleMapController controller) {
    _googleMapService.onMapCreated(controller);
    notifyListeners();
  }

  /// Initialize location tracking for tasks with status = 'delivering'
  ///
  /// Unsubscribe location tracking when delivery status is changed
  void initializeLocationTracking() async {
    log.i('Initializing location tracking for deliverer');
    await _locationTrackingService
        .requestLocationTrackingPermission();

    for (PackageRequest task
        in _deliveryService.currentTasksList.requestList) {
      if (task.status == deliveryStatus[2]) {
        log.i('this is task: $task');
        _locationTrackingService.initializeLocationTracking(
            notifyListeners, task.id!);
      }
    }
  }

  void unsubscribeLocationTracking() {
    _locationTrackingService.unsubscribeLocationTracking();
  }

  // Enable package tracking by only reading from RTDB & updating markers
  void initializePackageTracking(String deliveryId) {
    log.i('Initializing package tracking for requester');
    _packageTrackingService.activatePackageTrackingListeners(
        deliveryId, notifyListeners);
  }

  void unsubscribePackageTracking() {
    _packageTrackingService.unsubscribePackageTracking();
  }

  void navigateCameraToPackageLocation(String deliveryId) async {
    Map<String, double> location;
    if (deliveryId == "") {
      LocationData locationData =
          await _locationTrackingService.getLocation();
      location = {
        'latitude': locationData.latitude!,
        'longitude': locationData.longitude!,
      };
    } else {
      location = await _locationTrackingService
          .getPackageLocation(deliveryId);
    }
    _googleMapService.navigateToPackageLocation(location);
  }
}
