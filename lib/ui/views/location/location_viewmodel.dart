import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/services/google_map_service.dart';

class LocationViewModel extends BaseViewModel {
  final _googleMapService = locator<GoogleMapService>();

  bool get isMapCreated => _googleMapService.isMapCreated;

  GoogleMapController get controller => _googleMapService.controller;

  CameraPosition get initialCameraPosition =>
      _googleMapService.initialCameraPosition;

  Set<Marker> get markers => _googleMapService.markers;

  void init() async {
    await setMarkerIcon();
    addWestMarker();
  }

  void onMapCreated(GoogleMapController controller) {
    setMapController(controller);
    changeMapMode();

    setIsMapCreated(true);
  }

  // set marker icon
  Future setMarkerIcon() async {
    _googleMapService.setMarkerIcon();
  }

  // temporary method to add a marker
  void addWestMarker() {
    _googleMapService.addWestMarker();
  }

  void setMapController(GoogleMapController newController) {
    _googleMapService.setMapController(newController);
  }

  void setIsMapCreated(bool value) {
    _googleMapService.setIsMapCreated(value);
  }

  void changeMapMode() {
    _googleMapService.changeMapMode();
    notifyListeners();
  }

  Future<String> getJsonFile(String path) async {
    return _googleMapService.getJsonFile(path);
  }

  void setMapStyle(String mapStyle) {
    _googleMapService.setMapStyle(mapStyle);
  }
}
