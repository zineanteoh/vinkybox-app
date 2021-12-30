import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/location/location_viewmodel.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.reactive(
      onModelReady: (model) {
        model.init();
        model.initializeLocationService();
      },
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            model.isDelivering
                ? const Text('Delivering Package')
                : const Text('Tracking Package'),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                zoomGesturesEnabled: false,
                myLocationButtonEnabled: model.isDelivering, // temp
                myLocationEnabled: model.isDelivering, // temp
                onMapCreated: model.onMapCreated,
                initialCameraPosition: model.initialCameraPosition,
                markers: model.markers,
              ),
            )
          ],
        ),
        floatingActionButton: model.isDelivering
            ? Container()
            : FloatingActionButton(
                onPressed: () {
                  model.navigateCameraToSourceLocation();
                },
              ),
      ),
      viewModelBuilder: () => LocationViewModel(),
    );
  }
}
