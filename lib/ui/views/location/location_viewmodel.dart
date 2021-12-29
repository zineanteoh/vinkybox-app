import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/google_map_service.dart';
import 'package:vinkybox/services/location_service.dart';

class LocationViewModel extends BaseViewModel {
  final _googleMapService = locator<GoogleMapService>();
  final _locationService = locator<LocationService>();

  bool get isMapCreated => _googleMapService.isMapCreated;

  GoogleMapController get controller => _googleMapService.controller;

  CameraPosition get initialCameraPosition =>
      _googleMapService.initialCameraPosition;

  Set<Marker> get markers => _googleMapService.markers;

  void init() {
    _googleMapService.init();
  }

  void onMapCreated(GoogleMapController controller) {
    _googleMapService.onMapCreated(controller);
    notifyListeners();
  }

  void initializeLocationService() {
    _locationService.initializeLocationService();
  }
}
