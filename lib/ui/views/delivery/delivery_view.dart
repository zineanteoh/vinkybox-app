import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/my_current_packages_header.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/current_task_button/current_task_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/package_history_button/package_history_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/request_delivery_button/request_delivery_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/top_profile_bar/top_profile_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message/welcome_message.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({Key? key}) : super(key: key);

  Widget myPackagesSection(DeliveryViewModel model) {
    return <Widget>[
      MyCurrentPackagesHeader(
          myCurrentPackagesCount: model.getLatestRequestCount()),
      Container(
        child: model.isBusy
            ? const CircularProgressIndicator()
            : model.isRequestEmpty
                ? const Text(
                        'Nothing here... Why not request a delivery?')
                    .padding(top: 30)
                : DeliveryRequestItem(
                    deliveryRequest:
                        model.myCurrentPackagesList.requestList[0]),
      ),
    ].toColumn().padding(top: 25);
  }

  Widget userActionButtons(DeliveryViewModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UIHelper.verticalSpaceMedium(),
        RequestDeliveryButton(deliveryModel: model),
        UIHelper.verticalSpaceSmallMedium(),
        const PackageHistoryButton(),
        UIHelper.verticalSpaceSmallMedium(),
        const CurrentTaskButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeliveryViewModel>.reactive(
      disposeViewModel: false,
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
            Expanded(
              child: SmartRefresher(
                header: const ClassicHeader(
                  completeText: 'Request is up to date!',
                  idleText: 'Pull to Refresh',
                  refreshingText: 'Fetching Requests...',
                ),
                enablePullDown: true,
                controller: model.refreshController,
                onRefresh: model.onRefresh,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Column(
                    children: [
                      userActionButtons(model),
                      myPackagesSection(model),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ).padding(
          horizontal: 20,
          top: 30,
          bottom: 0,
        ),
      ),
      viewModelBuilder: () => DeliveryViewModel(),
    );
  }
}
