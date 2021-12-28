import 'dart:async';
import 'dart:collection';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class LocationViewModel extends BaseViewModel {
  bool _isMapCreated = false;
  bool get isMapCreated => _isMapCreated;

  late GoogleMapController _controller;
  GoogleMapController get controller => _controller;

  // Positions
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(36.14479001860207, -86.80285895018181),
    zoom: 16,
  );
  CameraPosition get initialCameraPosition => initialPosition;

  // Markers
  Set<Marker> _markers = HashSet<Marker>();
  Set<Marker> get markers => _markers;

  void onMapCreated(GoogleMapController controller) {
    setMapController(controller);
    changeMapMode();

    addWestMarker();

    setIsMapCreated(true);
  }

  /// temporary method to add a marker
  void addWestMarker() {
    _markers.add(const Marker(
        markerId: MarkerId('0'),
        position: LatLng(36.140420491942166, -86.79948097118331),
        infoWindow: InfoWindow(
            title: 'West House', snippet: 'Drop off Location')));
  }

  void setMapController(GoogleMapController newController) {
    _controller = newController;
  }

  void setIsMapCreated(bool value) {
    _isMapCreated = value;
  }

  void changeMapMode() {
    getJsonFile("assets/light_map.json").then(setMapStyle);
    notifyListeners();
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }
}
