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
  const DeliveryRequestItem({required this.deliveryRequest, Key? key})
      : super(key: key);

  // Widget function that builds the UI for a delivery request item
  Widget _buildRequestItem(
      dynamic document, DeliveryRequestItemModel model) {
    return <Widget>[
      // _name(document['user']['fullName']),
      _packageSize(document['packageSize']),
      // _time(document['time']),
      _location(document['pickUpLocation'], document['user']['dorm']),
      _status(document['status']),
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
          onTap: () {},
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
      builder: (context, model, child) =>
          _buildRequestItem(deliveryRequest, model),
      viewModelBuilder: () => DeliveryRequestItemModel(),
    );
  }
}

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
      .padding(top: 20, left: 20);
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
      Text('$size',
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
      .padding(top: 4, left: 20);
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
                  color: skyblueColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          Text(dropOffLocation,
              style: const TextStyle(
                  color: skyblueColor,
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
                    color: limeGreenColor);
              } else {
                return const SolidLineConnector();
              }
            },
            indicatorBuilder: (context, index) {
              // Status dot indicator
              int deliveryIndex = deliveryStatus.indexOf(status);
              if (index <= deliveryIndex) {
                return const DotIndicator(color: limeGreenColor);
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
