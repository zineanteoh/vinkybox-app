import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/request_delivery_button.dart/request_delivery_button.dart';

class DeliveryOverview extends StatelessWidget {
  const DeliveryOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: Column(
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RequestDeliveryButton(
                icon: CarbonIcons.delivery_parcel,
                iconBgColor: skyblueHex,
                title: "Request Delivery",
                description: "Too busy? Let others deliver for you!",
              ),
            ),
            // List of deliveries
            // Expanded(
            //   child: Container(
            //     height: 70.0,
            //     padding: const EdgeInsets.only(left: 20.0),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
