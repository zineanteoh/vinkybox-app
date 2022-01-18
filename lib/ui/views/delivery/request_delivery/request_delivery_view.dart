import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/text_styles.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/views/delivery/request_delivery/request_delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class RequestDeliveryView extends StatelessWidget {
  final DeliveryViewModel deliveryModel;
  const RequestDeliveryView({Key? key, required this.deliveryModel})
      : super(key: key);

  Widget requestSection(
      model, headerTitle, buttonsList, onSelectedFunction) {
    return <Widget>[
      UIHelper.verticalSpaceMedium(),
      Text('$headerTitle', style: subHeaderStyle),
      UIHelper.verticalSpaceSmall(),
      GroupButton(
        mainGroupAlignment: MainGroupAlignment.start,
        isRadio: true,
        spacing: 10,
        buttons: buttonsList,
        selectedColor: blueJeansColor,
        borderRadius: BorderRadius.circular(30),
        onSelected: (i, selected) => onSelectedFunction(i),
      ),
    ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start);
  }

  Widget packageOption(model, assetUrl, size, desc1, desc2) {
    return <Widget>[
      Image.asset(
        assetUrl,
      ).padding(left: 10, vertical: 10),
      <Widget>[
        Text(
          size,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600),
        ),
        Text(
          desc1,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400),
        ),
        Text(
          desc2,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400),
        )
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .padding(left: 10)
    ]
        .toRow(mainAxisSize: MainAxisSize.max)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25) // clip ripple
        .borderRadius(all: 25, animate: true)
        .elevation(
          20,
          // model.pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x30000000),
        )
        .constrained(height: 80)
        .gestures(
            // onTapChange: (tapState) =>
            //     model.updatePressedStatus(tapState),
            // onTap: model.onPress,
            )
        .scale(
          all: 1.0,
          // all: model.pressed ? 0.95 : 1.0,
          animate: true,
        )
        .animate(
          const Duration(milliseconds: 150),
          Curves.easeOut,
        )
        .padding(vertical: 15, left: 20);
  }

  Widget packageSizeButtons(model) {
    return <Widget>[
      packageOption(model, 'assets/images/box_small.png', 'Small',
          'Max: 1kg or 20cm', 'Carry with one hand'),
      packageOption(model, 'assets/images/box_small.png', 'Medium',
          'Max: 5kg or 50cm', 'Carry with two hands'),
      packageOption(model, 'assets/images/box_large.png', 'Large',
          'Max: 10kg or 100cm', 'Quite big'),
      packageOption(model, 'assets/images/box_small.png', 'Other',
          'Max: ??kg or over ??cm', 'Need a trolley'),
    ].toColumn(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget requestPackageSizeSection(model) {
    return <Widget>[
      UIHelper.verticalSpaceMedium(),
      const Text('Package Size', style: subHeaderStyle),
      UIHelper.verticalSpaceSmall(),
      packageSizeButtons(model),
    ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start);
  }

  Widget requestPickUpLocationSection(model) {
    return requestSection(model, "Pick up Location",
        requestPickUpLocation, model.selectPickUpLocation);
  }

  Widget requestDropOffLocationSection(model) {
    return requestSection(model, "Drop off Location",
        requestDropOffLocation, model.selectDropOffLocation);
  }

  Widget requestTimeSection(model) {
    return requestSection(
        model, "Between", requestTime, model.selectTime);
  }

  Widget requestConfirm(RequestDeliveryViewModel model) {
    return const Text(
      'Confirm',
      style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600),
    )
        .padding(vertical: 10, horizontal: 120)
        .borderRadius(all: 10)
        .ripple()
        .backgroundColor(brightGreenColor, animate: true)
        .clipRRect(all: 10)
        .borderRadius(all: 10, animate: true)
        .elevation(
          model.confirmPressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x30000000),
        )
        .gestures(
            onTapChange: (tapState) =>
                model.updateConfirmPressedStatus(tapState),
            onTap: () {
              model.submitRequest(deliveryModel);
            })
        .scale(
          all: model.confirmPressed ? 0.95 : 1.0,
          animate: true,
        )
        .animate(
          const Duration(milliseconds: 150),
          Curves.easeOut,
        );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RequestDeliveryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 50.0),
            child: Column(
              children: [
                HeaderBar(
                  model: model,
                  headerText: "Request Delivery",
                ),
                UIHelper.verticalSpaceMedium(),
                requestPackageSizeSection(model),
                // requestPickUpLocationSection(model),
                // requestDropOffLocationSection(model),
                // requestTimeSection(model),
                UIHelper.verticalSpaceMedium(),
                requestConfirm(model),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => RequestDeliveryViewModel(),
    );
  }
}
