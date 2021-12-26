import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/latest_requests_header.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/my_packages_button/my_packages_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/request_delivery_button/request_delivery_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/top_profile_bar/top_profile_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message/welcome_message.dart';

class DeliveryView extends StatelessWidget {
  DeliveryView({Key? key}) : super(key: key);

  // Widget latestRequestsPreview = Expanded(
  //   child: ,
  // );

  Widget latestRequest = Expanded(
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
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeliveryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const <Widget>[
                TopProfileBar(),
                WelcomeMessage(),
              ],
            ),
            latestRequest,
            // top 2 requests
            // latestRequestsPreview,
          ],
        ),
      ),
      viewModelBuilder: () => DeliveryViewModel(),
    );
  }
}
