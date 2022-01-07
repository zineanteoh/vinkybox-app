import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/delivery/delivery_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/latest_requests_header.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/my_packages_button/my_packages_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/request_delivery_button/request_delivery_button.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/top_profile_bar/top_profile_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/welcome_message/welcome_message.dart';

class DeliveryView extends StatefulWidget {
  const DeliveryView({Key? key}) : super(key: key);

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView>
    with AutomaticKeepAliveClientMixin<DeliveryView> {
  @override
  bool get wantKeepAlive => true;

  Widget latestRequests(DeliveryViewModel model) {
    return Column(
      children: [
        UIHelper.verticalSpaceMedium(),
        UIHelper.verticalSpaceMedium(),
        LatestRequestsHeader(
            latestRequestCount: model.getLatestRequestCount()),
        Container(
          child: model.isBusy
              ? const CircularProgressIndicator()
              : model.isRequestEmpty
                  ? const Text('There are no requests at the moment!')
                  : DeliveryRequestItem(
                      deliveryRequest: model.latestRequestList[0]),
        ),
      ],
    );
  }

  Widget userActionButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UIHelper.verticalSpaceMedium(),
        const RequestDeliveryButton(),
        UIHelper.verticalSpaceMedium(),
        const MyPackagesButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeliveryViewModel>.reactive(
      onModelReady: (model) => model.loadLatestRequests(),
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
                      userActionButtons(),
                      latestRequests(model),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ).padding(
          horizontal: 20,
          vertical: 50,
        ),
      ),
      viewModelBuilder: () => DeliveryViewModel(),
    );
  }
}
