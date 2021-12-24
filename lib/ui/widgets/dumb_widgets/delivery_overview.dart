import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/latest_requests_header.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/my_packages_button.dart/my_packages_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/request_delivery_button.dart/request_delivery_button.dart';

class DeliveryOverview extends StatelessWidget {
  const DeliveryOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceMedium(),
            const RequestDeliveryButton(),
            UIHelper.verticalSpaceMedium(),
            const MyPackagesButton(),
            UIHelper.verticalSpaceMedium(),
            UIHelper.verticalSpaceMedium(),
            const LatestRequestsHeader(),

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
