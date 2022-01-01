import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/delivery/latest_requests/latest_requests_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';

class LatestRequestsView extends StatelessWidget {
  const LatestRequestsView({Key? key}) : super(key: key);

  Widget _buildRequestList(LatestRequestsViewModel model) {
    return SmartRefresher(
      header: const ClassicHeader(
        completeText: 'Request is up to date!',
        idleText: 'Pull to Refresh',
        refreshingText: 'Fetching Requests...',
      ),
      enablePullDown: true,
      controller: model.refreshController,
      onRefresh: model.onRefresh,
      child: ListView.builder(
        itemCount: model.requestIsEmpty
            ? 1
            : model.deliveryRequestList.length,
        itemBuilder: (context, index) {
          return model.requestIsEmpty
              ? const Text('There are no requests at the moment!')
                  .alignment(Alignment.center)
              : DeliveryRequestItem(
                  deliveryRequest: model.deliveryRequestList[index]);
        },
        shrinkWrap: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LatestRequestsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(bottom: 32),
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 50.0),
            child: Column(
              children: [
                HeaderBar(
                  model: model,
                  headerText: "Latest Requests",
                ),
                UIHelper.verticalSpaceMedium(),
                // status
                model.isBusy
                    ? const CircularProgressIndicator()
                    : Expanded(child: _buildRequestList(model)),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LatestRequestsViewModel(),
    );
  }
}
