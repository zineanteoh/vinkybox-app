import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/google_map_service.dart';
import 'package:vinkybox/services/location_service.dart';
import 'package:vinkybox/services/package_tracking_service.dart';

class LocationViewModel extends BaseViewModel {
  final _googleMapService = locator<GoogleMapService>();
  final _locationService = locator<LocationService>();
  final _packageTrackingService = locator<PackageTrackingService>();

  bool get isMapCreated => _googleMapService.isMapCreated;

  GoogleMapController get controller => _googleMapService.controller;

  CameraPosition get initialCameraPosition =>
      _googleMapService.initialCameraPosition;

  Set<Marker> get markers => _googleMapService.markers;

  // TEMPORARY
  bool get isDelivering => _locationService.isDelivering;

  void init() {
    _googleMapService.init();
  }

  void onMapCreated(GoogleMapController controller) {
    _googleMapService.onMapCreated(controller);
    notifyListeners();
  }

  // Enable location tracking by writing to RTDB & updating google map markers
  void initializeLocationTracking() {
    _locationService.initializeLocationTracking(notifyListeners);
  }

  // Enable package tracking by only reading from RTDB & updating markers
  void initializePackageTracking() {
    _packageTrackingService.activatePackageTrackingListeners(
        'key1', notifyListeners);
  }

  void navigateCameraToPackageLocation() async {
    Map location = await _locationService.getPackageLocation();
    _googleMapService.navigateToPackageLocation(location);
  }
}
