import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/views/location/location_viewmodel.dart';
import 'package:styled_widget/styled_widget.dart';

class LocationView extends StatelessWidget {
  final String deliveryId;
  final bool isDelivering;
  const LocationView(
      {Key? key,
      required this.deliveryId,
      required this.isDelivering})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LocationViewModel>.reactive(
      onModelReady: (model) async {
        await model.init();
        if (isDelivering) {
          // read and write to location database
          model.initializeLocationTracking();
        } else {
          // read location database
          model.initializePackageTracking(deliveryId);
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
            isDelivering
                ? const Text('Delivering Package')
                    .alignment(Alignment.topCenter)
                    .padding(top: 60.0)
                : const Text('Tracking Package')
                    .alignment(Alignment.topCenter)
                    .padding(top: 60.0),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // model.isDelivering
            //     ? FloatingActionButton(
            //         onPressed: () =>
            //             model.unsubscribeLocationTracking(),
            //         backgroundColor: Colors.green,
            //         heroTag: 'location',
            //       )
            //     : FloatingActionButton(
            //         onPressed: () =>
            //             model.unsubscrivePackageTracking(),
            //         backgroundColor: Colors.lightBlue,
            //         heroTag: 'package',
            //       ),
            FloatingActionButton(
              onPressed: () {
                // todo: fix this
                if (isDelivering) {
                  model.navigateCameraToPackageLocation("");
                } else {
                  model.navigateCameraToPackageLocation(deliveryId);
                }
              },
            ),
          ],
        ),
      ),
      viewModelBuilder: () => LocationViewModel(),
    );
  }
}
