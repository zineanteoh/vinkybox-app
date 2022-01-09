import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:timelines/timelines.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

class DeliveryRequestItem extends StatelessWidget {
  final dynamic deliveryRequest;
  bool isUserTask;
  DeliveryRequestItem(
      {required this.deliveryRequest,
      this.isUserTask = false,
      Key? key})
      : super(key: key);

  _showModalBottomSheet(
      BuildContext context, DeliveryRequestItemModel model) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 1000,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: <Widget>[
            _packageSize(model.packageSizeInfo),
            _time(model.timeInfo),
            _location(model.pickUpLocationInfo, model.dormInfo),
            _status(model.statusInfo),
            model.isMyPackage() && model.statusIsNotNew()
                ? _name('Deliverer: ${model.delivererNameInfo}')
                : SizedBox.shrink(),
            getActionOrPackageButton(model, context),
          ]
              .toColumn(mainAxisSize: MainAxisSize.min)
              .padding(bottom: 70),
        );
      },
    );
  }

  // Widget function that builds the UI for a delivery request item
  Widget _buildRequestItem(BuildContext context,
      DeliveryRequestItemModel model, dynamic request) {
    return <Widget>[
      _packageSize(model.packageSizeInfo),
      _location(model.pickUpLocationInfo, model.dormInfo),
      _status(model.statusInfo),
      _taskActionButton(isUserTask, model, context),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25)
        .borderRadius(all: 25, animate: true)
        .elevation(
          model.pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x30000000),
        )
        .gestures(
          onTapChange: (tapState) =>
              model.updatePressedStatus(tapState),
          onTap: () {
            _showModalBottomSheet(context, model);
          },
        )
        .scale(
          all: model.pressed ? 0.95 : 1.0,
          animate: true,
        )
        .animate(
          const Duration(milliseconds: 150),
          Curves.easeOut,
        )
        .padding(vertical: 10);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeliveryRequestItemModel>.reactive(
      onModelReady: (model) =>
          model.onModelReadyLoad(deliveryRequest),
      builder: (context, model, child) =>
          _buildRequestItem(context, model, deliveryRequest),
      viewModelBuilder: () => DeliveryRequestItemModel(),
    );
  }
}

// Helper methods for DeliveryRequestItem

String _getDeliveryStatusMessage(String status) {
  switch (status) {
    case 'new':
      return 'New Request!';
    case 'collecting':
      return 'Package is being collected';
    case 'delivering':
      return 'Delivering...';
    case 'delivered':
      return 'Delivered Successfully!';
    default:
      return 'Request is cancelled';
  }
}

Widget _name(String name) {
  return Text(name, style: const TextStyle(fontSize: 18))
      .padding(bottom: 20)
      .alignment(Alignment.center);
}

Widget _packageSize(String size) {
  Widget getBoxSizeIcon(String size) {
    int index = requestPackageSize.indexOf(size);
    return Icon(packageSizeIcon[index]);
  }

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      getBoxSizeIcon(size),
      Text(' $size',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
    ],
  ).padding(top: 20);
}

Widget _time(String time) {
  // '2:50PM, Jan 1',
  return Text(time,
          style: const TextStyle(fontSize: 14, color: Colors.black38))
      .padding(vertical: 15);
}

Widget _location(String pickUpLocation, String dropOffLocation) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Pick Up',
              style:
                  TextStyle(color: Colors.blue[200], fontSize: 14)),
          Text('Drop Off',
              style: TextStyle(color: Colors.blue[200], fontSize: 14))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pickUpLocation,
              style: const TextStyle(
                  color: blueJeansColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Text(dropOffLocation,
              style: const TextStyle(
                  color: blueJeansColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      )
    ],
  ).padding(vertical: 12, horizontal: 20);
}

Widget _status(String status) {
  return Column(
    children: [
      ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 15),
        child: Timeline.tileBuilder(
          theme: TimelineThemeData(
            direction: Axis.horizontal,
            nodePosition: 0,
            color: const Color(0xffc2c5c9),
            connectorTheme: const ConnectorThemeData(
              thickness: 3.0,
            ),
          ),
          shrinkWrap: true,
          builder: TimelineTileBuilder.connected(
            connectorBuilder: (context, index, type) {
              // Status line connector
              int deliveryIndex = deliveryStatus.indexOf(status);
              if (index < deliveryIndex) {
                return const SolidLineConnector(
                    color: mediumSpringGreenColor);
              } else {
                return const SolidLineConnector();
              }
            },
            indicatorBuilder: (context, index) {
              // Status dot indicator
              int deliveryIndex = deliveryStatus.indexOf(status);
              if (index <= deliveryIndex) {
                return const DotIndicator(
                    color: mediumSpringGreenColor);
              } else {
                return const DotIndicator();
              }
            },
            itemExtentBuilder: (context, index) => 50,
            itemCount: 4,
          ),
        ),
      ),
      // Delivery status message
      Text(_getDeliveryStatusMessage(status),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54))
          .padding(top: 10),
    ],
  ).alignment(Alignment.center).padding(top: 12, bottom: 20);
}

Widget _taskActionButton(bool isUserTask,
    DeliveryRequestItemModel model, BuildContext context) {
  return isUserTask
      ? const Text('I am ready to pickup',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600))
          .padding(vertical: 10, horizontal: 25)
          .borderRadius(all: 10)
          .ripple()
          .backgroundColor(mediumSpringGreenColor, animate: true)
          .clipRRect(all: 10)
          .borderRadius(all: 10, animate: true)
          .elevation(
            model.userTaskActionPressed ? 0 : 20,
            borderRadius: BorderRadius.circular(25),
            shadowColor: const Color(0x30000000),
          )
          .gestures(
            onTapChange: (tapState) =>
                model.updateUserTaskActionPressedStatus(tapState),
            onTap: () {
              print('Ready to pick up!');
              // model.acceptRequest();
              // Navigator.pop(context);
            },
          )
          .scale(
            all: model.acceptPressed ? 0.8 : 1.0,
            animate: true,
          )
          .animate(
            const Duration(milliseconds: 150),
            Curves.easeOut,
          )
          .alignment(Alignment.center)
          .padding(bottom: 15)
      : Container();
}

Widget _actionButtons(
    DeliveryRequestItemModel model, BuildContext context) {
  return <Widget>[
    const Text('Cancel',
            style: TextStyle(
                color: Color.fromARGB(255, 109, 109, 109),
                fontSize: 24,
                fontWeight: FontWeight.w600))
        .padding(vertical: 10, horizontal: 25)
        .borderRadius(all: 10)
        .ripple()
        .backgroundColor(Color.fromARGB(255, 229, 229, 229),
            animate: true)
        .clipRRect(all: 10)
        .borderRadius(all: 10, animate: true)
        .elevation(
          model.cancelPressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x30000000),
        )
        .gestures(
            onTapChange: (tapState) =>
                model.updateCancelPressedStatus(tapState),
            onTap: () {
              Navigator.pop(context);
            })
        .scale(
          all: model.cancelPressed ? 0.8 : 1.0,
          animate: true,
        )
        .animate(
          const Duration(milliseconds: 150),
          Curves.easeOut,
        )
        .padding(right: 20),
    // accept button
    const Text('Accept',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600))
        .padding(vertical: 10, horizontal: 25)
        .borderRadius(all: 10)
        .ripple()
        .backgroundColor(brightGreenColor, animate: true)
        .clipRRect(all: 10)
        .borderRadius(all: 10, animate: true)
        .elevation(
          model.acceptPressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x30000000),
        )
        .gestures(
          onTapChange: (tapState) =>
              model.updateAcceptPressedStatus(tapState),
          onTap: () {
            print('Accepting request!');
            model.acceptRequest();
            Navigator.pop(context);
          },
        )
        .scale(
          all: model.acceptPressed ? 0.8 : 1.0,
          animate: true,
        )
        .animate(
          const Duration(milliseconds: 150),
          Curves.easeOut,
        ),
  ]
      .toRow(mainAxisAlignment: MainAxisAlignment.center)
      .padding(top: 10);
}

Widget _trackPackageButton(
    DeliveryRequestItemModel model, BuildContext context) {
  return const Text(
    'Track Package',
    style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600),
  )
      .padding(vertical: 10, horizontal: 60)
      .borderRadius(all: 10)
      .ripple()
      .backgroundColor(brightGreenColor, animate: true)
      .clipRRect(all: 10)
      .borderRadius(all: 10, animate: true)
      .elevation(
        model.trackPackagePressed ? 0 : 20,
        borderRadius: BorderRadius.circular(25),
        shadowColor: const Color(0x30000000),
      )
      .gestures(
          onTapChange: (tapState) =>
              model.updateTrackPackagePressedStatus(tapState),
          onTap: () {
            model.navigateToLocationView();
          })
      .scale(
        all: model.trackPackagePressed ? 0.95 : 1.0,
        animate: true,
      )
      .animate(
        const Duration(milliseconds: 150),
        Curves.easeOut,
      );
}

Widget getActionOrPackageButton(
    DeliveryRequestItemModel model, BuildContext context) {
  // my package & not new => track
  // my package & new => sizedbox
  // not my package & not new => sizedbox
  // not my package & new => action buttons
  if (model.isMyPackage()) {
    return model.statusIsNotNew()
        ? _trackPackageButton(model, context)
        : const SizedBox.shrink();
  }
  return model.statusIsNotNew()
      ? const SizedBox.shrink()
      : _actionButtons(model, context);
}
