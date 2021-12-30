import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vinkybox/app/app.locator.dart';
import 'package:vinkybox/app/app.logger.dart';
import 'package:vinkybox/services/location_service.dart';

class GoogleMapService {
  final _locationService = locator<LocationService>();

  final log = getLogger('GoogleMapService');

  bool _isMapCreated = false;
  bool get isMapCreated => _isMapCreated;

  late GoogleMapController _controller;
  GoogleMapController get controller => _controller;

  // Vanderbilt position
  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(36.14479001860207, -86.80285895018181),
    zoom: 16,
  );
  CameraPosition get initialCameraPosition => initialPosition;

  // Markers
  Set<Marker> _markers = HashSet<Marker>();
  Set<Marker> get markers => _markers;

  // Bitmap
  late BitmapDescriptor _markerIcon;

  Future init() async {
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
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/squirrel.png');
  }

  // temporary method to add a marker
  Future addWestMarker() async {
    _markers.add(
      Marker(
        markerId: const MarkerId('0'),
        position:
            const LatLng(36.140420491942166, -86.79948097118331),
        infoWindow: const InfoWindow(
            title: 'West House', snippet: 'Drop off Location'),
        icon: _markerIcon,
      ),
    );
  }

  void setMapController(GoogleMapController newController) {
    _controller = newController;
  }

  void setIsMapCreated(bool value) {
    _isMapCreated = value;
  }

  void changeMapMode() {
    getJsonFile("assets/light_map.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  // Navigate camera to source location
  void navigateToSourceLocation() async {
    Map sourceLocation = await _locationService.getSourceLocation();
    log.i('${sourceLocation}');

    _controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(double.parse(sourceLocation['lat']),
            double.parse(sourceLocation['lng'])),
        16));
  }
}
