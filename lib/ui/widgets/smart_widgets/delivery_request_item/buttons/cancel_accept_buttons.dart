import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

Widget cancelAcceptButtons(
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
