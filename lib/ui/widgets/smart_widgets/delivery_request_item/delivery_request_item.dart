import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:timelines/timelines.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/helpers/time_ago.dart';
import 'package:vinkybox/models/application_models.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

class DeliveryRequestItem extends StatelessWidget {
  final PackageRequest deliveryRequest;
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
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.w),
                topRight: Radius.circular(30.w),
              )),
          child: <Widget>[
            _packageSize(model.packageSizeInfo),
            _time(model.timeInfo),
            _location(model.pickUpLocationInfo, model.dormInfo),
            _status(model.statusInfo),
            model.isMyPackage() && model.statusIsNotNew()
                ? _name('Deliverer: ${model.delivererNameInfo}')
                : const SizedBox.shrink(),
            getActionOrPackageButton(model, context),
          ]
              .toColumn(mainAxisSize: MainAxisSize.min)
              .padding(bottom: 70.h),
        );
      },
    );
  }

  // Widget function that builds the UI for a delivery request item
  Widget _buildRequestItem(BuildContext context,
      DeliveryRequestItemModel model, dynamic request) {
    return <Widget>[
      _packageSize(model.packageSizeInfo),
      isUserTask
          ? _name('Deliver to: ${model.nameInfo}')
          : const SizedBox.shrink(),
      _time(model.timeInfo).alignment(Alignment.center),
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
        .padding(top: 10.h);
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
  return Text(name, style: TextStyle(fontSize: 16.sp))
      .padding(top: 8.h)
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
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          )),
    ],
  ).padding(top: 10.h);
}

Widget _time(String time) {
  return Text(TimeAgo.timeAgoSinceDate(time),
          style: TextStyle(fontSize: 14.sp, color: Colors.black38))
      .padding(top: 15.h);
}

Widget _location(String pickUpLocation, String dropOffLocation) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Pick Up',
              style: TextStyle(
                  color: Colors.blue[200], fontSize: 14.sp)),
          Text('Drop Off',
              style:
                  TextStyle(color: Colors.blue[200], fontSize: 14.sp))
        ],
      ),
      <Widget>[
        Expanded(
          child: SizedBox(
            child: Text(
              pickUpLocation,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: blueJeansColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Text(
              dropOffLocation,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: blueJeansColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ].toRow()
    ],
  ).padding(vertical: 12.h, horizontal: 20.w);
}

Widget _status(String status) {
  return Column(
    children: [
      ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 15.h),
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
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54))
          .padding(top: 10.h),
    ],
  ).alignment(Alignment.center).padding(top: 12.h, bottom: 18.h);
}

Widget _taskActionButton(bool isUserTask,
    DeliveryRequestItemModel model, BuildContext context) {
  return isUserTask
      ? model.statusInfo == deliveryStatus[1]
          ? Text('I am ready to pickup',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600))
              .padding(vertical: 10.h, horizontal: 25.w)
              .borderRadius(all: 10.r)
              .ripple()
              .backgroundColor(orangeYellowCrayolaColor,
                  animate: true)
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
                  model.pickUpRequest();
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
              )
              .alignment(Alignment.center)
              .padding(bottom: 15.h)
          : model.statusInfo == deliveryStatus[2]
              ? Text('Delivery Complete!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600))
                  .padding(vertical: 10.h, horizontal: 25.w)
                  .borderRadius(all: 10.r)
                  .ripple()
                  .backgroundColor(mediumSpringGreenColor,
                      animate: true)
                  .clipRRect(all: 10)
                  .borderRadius(all: 10, animate: true)
                  .elevation(
                    model.userTaskActionPressed ? 0 : 20,
                    borderRadius: BorderRadius.circular(25),
                    shadowColor: const Color(0x30000000),
                  )
                  .gestures(
                    onTapChange: (tapState) => model
                        .updateUserTaskActionPressedStatus(tapState),
                    onTap: () {
                      // model.pickUpRequest();
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
                  )
                  .alignment(Alignment.center)
                  .padding(bottom: 15.h)
              : const SizedBox.shrink()
      : const SizedBox.shrink();
}

Widget _actionButtons(
    DeliveryRequestItemModel model, BuildContext context) {
  return <Widget>[
    Text('Cancel',
            style: TextStyle(
                color: const Color.fromARGB(255, 109, 109, 109),
                fontSize: 22.sp,
                fontWeight: FontWeight.w600))
        .padding(vertical: 10.h, horizontal: 25.w)
        .borderRadius(all: 10.r)
        .ripple()
        .backgroundColor(const Color.fromARGB(255, 229, 229, 229),
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
        ),
    // accept button
    Text('Accept',
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600))
        .padding(vertical: 10.h, horizontal: 25.w)
        .borderRadius(all: 10.r)
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
            model.acceptRequest();
            Navigator.pop(context);
            // redirect user to home page
            model.navigateToHomePage();
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
      .toRow(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      )
      .padding(top: 10.h);
}

Widget _trackPackageButton(
    DeliveryRequestItemModel model, BuildContext context) {
  return Text(
    'Track Package',
    style: TextStyle(
        color: Colors.white,
        fontSize: 22.sp,
        fontWeight: FontWeight.w600),
  )
      .padding(vertical: 10.h, horizontal: 60.w)
      .borderRadius(all: 10.r)
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
            model.trackPackage();
          })
      .scale(
        all: model.trackPackagePressed ? 0.95 : 1.0,
        animate: true,
      )
      .animate(
        const Duration(milliseconds: 150),
        Curves.easeOut,
      )
      .padding(top: 20.h);
}

Widget getActionOrPackageButton(
    DeliveryRequestItemModel model, BuildContext context) {
  // my package & not delivering => track
  // my package & delivering => sizedbox
  // not my package & not new => sizedbox
  // not my package & new => action buttons
  if (model.isMyPackage()) {
    return model.statusIsDelivering()
        ? _trackPackageButton(model, context)
        : const SizedBox.shrink();
  }
  return model.statusIsNotNew()
      ? const SizedBox.shrink()
      : _actionButtons(model, context);
}
