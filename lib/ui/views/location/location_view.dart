import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/location/location_viewmodel.dart';

class LocationView extends StatelessWidget {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  model.setMapController(controller);
                  model.setIsMapCreated(true);
                  model.changeMapMode();
                },
                initialCameraPosition: model.initialCameraPosition,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            // model.getCurrentLocation();
          },
        ),
      ),
      viewModelBuilder: () => LocationViewModel(),
    );
  }
}
