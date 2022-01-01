import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:location/location.dart';
import 'package:vinkybox/app/app.logger.dart';

class GoogleMapService {
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

  // Bitmap icons
  late BitmapDescriptor _destinationMarkerIcon;
  late BitmapDescriptor _packageMarkerIcon;

  Future init() async {
    await setMarkerIcons();
    addDestinationMarker();
    addPackageMarker();
  }

  void onMapCreated(GoogleMapController controller) {
    setMapController(controller);
    changeMapMode();

    setIsMapCreated(true);
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

  // <---- Methods associated with Markers go below ---->

  Future setMarkerIcons() async {
    _destinationMarkerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/squirrel.png');
    _packageMarkerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/package.png');
  }

  void addDestinationMarker() {
    _markers.add(
      Marker(
        markerId: const MarkerId('0'),
        position:
            const LatLng(36.140420491942166, -86.79948097118331),
        infoWindow: const InfoWindow(
            title: 'West House', snippet: 'Drop off Location'),
        icon: _destinationMarkerIcon,
      ),
    );
  }

  void addPackageMarker() {
    _markers.add(Marker(
      markerId: const MarkerId('1'),
      position: const LatLng(36.145262, -86.802859),
      infoWindow: const InfoWindow(
          title: 'Vinky', snippet: 'Your Package is with him/her!'),
      icon: _packageMarkerIcon,
    ));
  }

  /// updateMarker updates marker location and calls viewmodel's notifyListener function
  Future updateMarker(double latitude, double longitude,
      Function notifyListeners) async {
    List<Marker> updatedMarkers = [];

    // Change LatLng for package marker
    updatedMarkers.add(_markers
        .toList()
        .first
        .copyWith(positionParam: LatLng(latitude, longitude)));
    // Keep destination marker the same
    updatedMarkers.add(_markers.toList().last.copyWith());

    // Update markers on map
    MarkerUpdates.from(_markers, Set<Marker>.from(updatedMarkers));
    _markers = Set<Marker>.from(updatedMarkers);

    notifyListeners();
  }

  // Navigate camera to package location
  void navigateToPackageLocation(Map packageLocation) async {
    log.i('${packageLocation}');

    _controller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(double.parse(packageLocation['latitude']),
            double.parse(packageLocation['longitude'])),
        16));
  }
}
