import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

Widget trackPackageButton(
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
