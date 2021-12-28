import 'dart:async';

import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class LocationViewModel extends BaseViewModel {
  bool _isMapCreated = false;
  bool get isMapCreated => _isMapCreated;

  late GoogleMapController _controller;
  GoogleMapController get controller => _controller;

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(36.14479001860207, -86.80285895018181),
    zoom: 16,
  );
  CameraPosition get initialPos => initialPosition;

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
