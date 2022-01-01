import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/location/location_viewmodel.dart';
import 'package:styled_widget/styled_widget.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.reactive(
      onModelReady: (model) {
        model.init();
        if (model.isDelivering) {
          model.initializeLocationTracking();
        } else {
          model.initializePackageTracking();
        }
      },
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                zoomGesturesEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                onMapCreated: model.onMapCreated,
                initialCameraPosition: model.initialCameraPosition,
                markers: model.markers,
              ),
            ),
            model.isDelivering
                ? const Text('Delivering Package')
                    .alignment(Alignment.topCenter)
                    .padding(top: 60.0)
                : const Text('Tracking Package')
                    .alignment(Alignment.topCenter)
                    .padding(top: 60.0),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.navigateCameraToPackageLocation();
          },
        ),
      ),
      viewModelBuilder: () => LocationViewModel(),
    );
  }
}
