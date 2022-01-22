import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/constants/request_info.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/views/delivery/request_delivery/request_delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class RequestDeliveryView extends StatelessWidget {
  final DeliveryViewModel deliveryModel;
  const RequestDeliveryView({Key? key, required this.deliveryModel})
      : super(key: key);

  Widget requestSizeSection(RequestDeliveryViewModel model) {
    return <Widget>[
      <Widget>[
        Flexible(
          child: Text(
            'How big is your package?',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ].toRow().padding(bottom: 10.h),
      packageSizeButtons(model),
    ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start);
  }

  Widget requestLocationSection(RequestDeliveryViewModel model) {
    return <Widget>[
      <Widget>[
        Flexible(
          child: Text(
            'Where is your package located?',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ].toRow().padding(bottom: 10.h),
      requestPickUpLocationSection(model),
      requestDropOffLocationSection(model),
    ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start);
  }

  Widget packageSizeButtons(RequestDeliveryViewModel model) {
    return <Widget>[
      sizeOption(
        model,
        'assets/images/box_small.png',
        'Small',
        'Max: 1kg or 20cm',
        'Carry with one hand',
        PackageSize.Small,
      ),
      sizeOption(
        model,
        'assets/images/box_medium.png',
        'Medium',
        'Max: 5kg or 50cm',
        'Carry with two hands',
        PackageSize.Medium,
      ),
      sizeOption(
        model,
        'assets/images/box_large.png',
        'Large',
        'Max: 10kg or 100cm',
        'Quite big',
        PackageSize.Large,
      ),
      sizeOption(
        model,
        'assets/images/question_mark.png',
        'Other',
        'Over 10kg or 100cm',
        'Need a trolley',
        PackageSize.Other,
      ),
    ].toColumn();
  }

  Widget sizeOption(
      RequestDeliveryViewModel model,
      String assetUrl,
      String packageSize,
      String desc1,
      String desc2,
      PackageSize radioValue) {
    return <Widget>[
      <Widget>[
        Image.asset(
          assetUrl,
          height: 80.sp,
        ).padding(vertical: 10.h),
        <Widget>[
          Text(
            packageSize,
            style: TextStyle(
                fontSize: 22.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            desc1,
            style: TextStyle(
                fontSize: 15.sp, fontWeight: FontWeight.w400),
          ),
          Text(
            desc2,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          )
        ]
            .toColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .padding(left: 5.w),
      ].toRow(),
      // Radio button
      Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.grey,
        ),
        child: Transform.scale(
          scale: 2.0.w,
          child: Radio<PackageSize>(
            groupValue: model.currentSize,
            value: radioValue,
            onChanged: (PackageSize? packageSize) {
              model.setCurrentSize(packageSize);
            },
            activeColor: blueJeansColor,
          ),
        ),
      ).padding(right: 10.w),
    ]
        .toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween)
        .gestures(
      onTapChange: (tapState) {
        model.setCurrentSize(radioValue);
      },
    );
  }

  Widget locationOption(
      model, headerTitle, buttonsList, onSelectedFunction) {
    return <Widget>[
      Text('$headerTitle', style: TextStyle(fontSize: 16.sp)),
      // Temporary group buttons
      GroupButton(
        mainGroupAlignment: MainGroupAlignment.start,
        isRadio: true,
        spacing: 10.w,
        buttons: buttonsList,
        selectedColor: blueJeansColor,
        borderRadius: BorderRadius.circular(30),
        onSelected: (i, selected) => onSelectedFunction(i),
      ).padding(top: 10.h),
    ]
        .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start)
        .padding(top: 20.h);
  }

  Widget requestPickUpLocationSection(model) {
    return locationOption(model, "Pick up Location",
        requestPickUpLocation, model.selectPickUpLocation);
  }

  Widget requestDropOffLocationSection(model) {
    return locationOption(model, "Drop off Location",
        requestDropOffLocation, model.selectDropOffLocation);
  }

  // Widget requestTimeSection(model) {
  //   return locationOption(
  //       model, "Between", requestTime, model.selectTime);
  // }

  Widget requestNext(RequestDeliveryViewModel model) {
    return Text(
      'Next',
      style: TextStyle(
          color: Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600),
    )
        .padding(vertical: 10.h, horizontal: 120.w)
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
    return Text(
      'Confirm',
      style: TextStyle(
          color: Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600),
    )
        .padding(vertical: 10.h, horizontal: 120.w)
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
          child: <Widget>[
            HeaderBar(
              model: model,
              headerText: "Request a Delivery",
            ).padding(
              bottom: 10.h,
            ),
            (model.currentStage == RequestDeliveryStage.selectingSize)
                ? <Widget>[
                    requestSizeSection(model).padding(
                      top: 15.h,
                      bottom: 20.h,
                    ),
                    requestNext(model),
                  ].toColumn()
                : <Widget>[
                    requestLocationSection(model).padding(
                      top: 15.h,
                      bottom: 20.h,
                    ),
                    requestConfirm(model),
                  ].toColumn(),
          ].toColumn().padding(top: 30.h, horizontal: 25.w),
        ),
      ),
      viewModelBuilder: () => RequestDeliveryViewModel(),
    );
  }
}
