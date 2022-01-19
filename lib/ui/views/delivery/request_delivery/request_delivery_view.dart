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

  Widget packageOption(
      RequestDeliveryViewModel model,
      String assetUrl,
      String size,
      String desc1,
      String desc2,
      PackageSize radioValue) {
    return <Widget>[
      Row(
        children: [
          Image.asset(
            assetUrl,
            height: 95,
          ).padding(vertical: 10),
          <Widget>[
            Text(
              size,
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w600),
            ),
            Text(
              desc1,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              desc2,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            )
          ]
              .toColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              )
              .padding(left: 10),
        ],
      ),
      // Radio button
      Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.grey,
        ),
        child: Transform.scale(
          scale: 2.0,
          child: Radio<PackageSize>(
            groupValue: model.currentSize,
            value: radioValue,
            onChanged: (PackageSize? size) {
              model.setCurrentSize(size);
            },
            activeColor: blueJeansColor,
          ),
        ),
      )
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
        .gestures(
      onTapChange: (tapState) {
        model.setCurrentSize(radioValue);
      },
    );
  }

  Widget packageSizeButtons(RequestDeliveryViewModel model) {
    return <Widget>[
      packageOption(
        model,
        'assets/images/box_small.png',
        'Small',
        'Max: 1kg or 20cm',
        'Carry with one hand',
        PackageSize.Small,
      ),
      packageOption(
        model,
        'assets/images/box_medium.png',
        'Medium',
        'Max: 5kg or 50cm',
        'Carry with two hands',
        PackageSize.Medium,
      ),
      packageOption(
        model,
        'assets/images/box_large.png',
        'Large',
        'Max: 10kg or 100cm',
        'Quite big',
        PackageSize.Large,
      ),
      packageOption(
        model,
        'assets/images/question_mark.png',
        'Other',
        'Over 10kg or 100cm',
        'Need a trolley',
        PackageSize.Other,
      ),
    ].toColumn();
  }

  Widget requestPackageSizeSection(RequestDeliveryViewModel model) {
    return <Widget>[
      UIHelper.verticalSpaceMedium(),
      const <Widget>[
        Flexible(
          child: Text(
            'How big is your package?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ].toRow(),
      UIHelper.verticalSpaceSmall(),
      packageSizeButtons(model),
    ]
        .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start)
        .padding(horizontal: 30, bottom: 15);
  }

  Widget requestLocationSection(RequestDeliveryViewModel model) {
    return <Widget>[
      UIHelper.verticalSpaceMedium(),
      const <Widget>[
        Flexible(
          child: Text(
            'Where is your package located?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ].toRow(),
      UIHelper.verticalSpaceSmall(),
      requestPickUpLocationSection(model),
      requestDropOffLocationSection(model),
    ]
        .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start)
        .padding(horizontal: 30);
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

  Widget requestNext(RequestDeliveryViewModel model) {
    return const Text(
      'Next',
      style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600),
    )
        .padding(vertical: 10, horizontal: 120)
        .borderRadius(all: 10)
        .ripple()
        .backgroundColor(
            model.currentSize == PackageSize.None
                ? lightBlueColor
                : blueJeansColor,
            animate: true)
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
              model.nextStage();
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
          child: Column(
            children: [
              HeaderBar(
                model: model,
                headerText: "Delivery Request",
              ).padding(horizontal: 20.0, top: 50.0),
              UIHelper.verticalSpaceSmall(),
              (model.currentStage ==
                      RequestDeliveryStage.selectingSize)
                  ? <Widget>[
                      requestPackageSizeSection(model),
                      UIHelper.verticalSpaceMedium(),
                      requestNext(model),
                    ].toColumn()
                  : <Widget>[
                      requestLocationSection(model),
                      UIHelper.verticalSpaceMedium(),
                      requestConfirm(model),
                    ].toColumn(),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => RequestDeliveryViewModel(),
    );
  }
}
