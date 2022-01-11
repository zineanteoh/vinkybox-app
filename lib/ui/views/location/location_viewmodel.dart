import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/google_map_service.dart';
import 'package:vinkybox/services/location_service.dart';
import 'package:vinkybox/services/package_tracking_service.dart';

class LocationViewModel extends BaseViewModel {
  final log = getLogger('LocationViewModel');

  final _googleMapService = locator<GoogleMapService>();
  final _locationService = locator<LocationService>();
  final _packageTrackingService = locator<PackageTrackingService>();

  bool get isMapCreated => _googleMapService.isMapCreated;

  GoogleMapController get controller => _googleMapService.controller;

  CameraPosition get initialCameraPosition =>
      _googleMapService.initialCameraPosition;

  Set<Marker> get markers => _googleMapService.markers;

  bool get isUserDelivering => _locationService.isUserDelivering;

  Future init() async {
    log.i('Initializing location view model');
    await _googleMapService.init();
  }

  void onMapCreated(GoogleMapController controller) {
    _googleMapService.onMapCreated(controller);
    notifyListeners();
  }

  // Enable location tracking by writing to RTDB & updating google map markers
  void initializeLocationTracking(String deliveryId) {
    log.i('Initializing location tracking for deliverer');
    _locationService.initializeLocationTracking(
        notifyListeners, deliveryId);
  }

  void unsubscribeLocationTracking() {
    _locationService.unsubscribeLocationTracking();
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

  void navigateCameraToPackageLocation() async {
    Map location = await _locationService.getPackageLocation();
    _googleMapService.navigateToPackageLocation(location);
  }
}
