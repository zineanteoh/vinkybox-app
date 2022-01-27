import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item_model.dart';

Widget deliveryCompleteButton(
    DeliveryRequestItemModel model, BuildContext context) {
  return Text('Delivery Complete!',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600))
      .padding(vertical: 10.h, horizontal: 25.w)
      .borderRadius(all: 10.r)
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
          // complete request delivery
          model.completeDeliveryRequest();
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
      .padding(bottom: 15.h);
}
