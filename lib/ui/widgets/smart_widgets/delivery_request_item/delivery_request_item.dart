import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:timelines/timelines.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

class DeliveryRequestItem extends StatelessWidget {
  final dynamic deliveryRequest;
  const DeliveryRequestItem({required this.deliveryRequest, Key? key})
      : super(key: key);

  Widget _buildRequestItem(
      dynamic document, DeliveryRequestItemModel model) {
    return _getItem(
      model: model,
      child: <Widget>[
        name(document['user']['fullName']),
        time(document['time']),
        location(
            document['pickUpLocation'], document['user']['dorm']),
        status(),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget name(String name) {
    return Text(name, style: const TextStyle(fontSize: 18))
        .padding(top: 20, left: 20);
  }

  Widget time(String time) {
    // '2:50PM, Jan 1',
    return Text(time,
            style:
                const TextStyle(fontSize: 14, color: Colors.black38))
        .padding(top: 4, left: 20);
  }

  Widget location(String pickUpLocation, String dropOffLocation) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pick Up',
                style:
                    TextStyle(color: Colors.blue[200], fontSize: 14)),
            Text('Drop Off',
                style:
                    TextStyle(color: Colors.blue[200], fontSize: 14))
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

  Widget status() {
    return Center(
      child: Column(
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
                  // TODO: make this dynamic, based on delivery status
                  if (index == -1) {
                    return const SolidLineConnector(
                        color: limeGreenColor);
                  } else {
                    return const SolidLineConnector();
                  }
                },
                indicatorBuilder: (context, index) {
                  // TODO: make this dynamic, based on delivery status
                  if (index == 0) {
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
          // TODO: make this dynamic, based on delivery status
          const Text('New Request!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54))
              .padding(top: 10),
        ],
      ),
    ).padding(top: 12, bottom: 20);
  }

  Widget _getItem(
      {required Widget child,
      required DeliveryRequestItemModel model}) {
    return Styled.widget(child: child)
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
