import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/ui_helpers.dart';
import 'package:vinkybox/ui/views/deliver_for_others/deliver_for_others_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/deliver_for_others_header.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';

class DeliverForOthersView extends StatelessWidget {
  const DeliverForOthersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeliverForOthersViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: <Widget>[
          UIHelper.verticalSpaceMedium(),
          UIHelper.verticalSpaceMedium(),
          DeliverForOthersHeader(
              latestRequestCount: model.getLatestRequestCount()),
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
                itemCount: model.isRequestEmpty
                    ? 1
                    : model.latestRequestList.length,
                itemBuilder: (context, index) {
                  return model.isRequestEmpty
                      ? const Text(
                          'There are no requests at the moment!')
                      : model.isBusy
                          ? const CircularProgressIndicator()
                          : DeliveryRequestItem(
                              deliveryRequest:
                                  model.latestRequestList[index]);
                },
              ),
            ),
          )
        ].toColumn().padding(horizontal: 20, top: 50),
      ),
      viewModelBuilder: () => DeliverForOthersViewModel(),
    );
  }
}

// body: Column(
//   children: [
//     Row(
//       children: [
//         // Text('deliver package')
//         ElevatedButton(
//           onPressed: () {
//             model.navigateToCurrentDeliveryView();
//           },
//           child: const Text('deliver package'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             model.navigateToLocationView();
//           },
//           child: const Text('track package'),
//         ),
//       ],
//     ).padding(horizontal: 20, top: 50),
//     deliverForOthersSection(model),
//   ],
// ).padding(
//   horizontal: 20,
//   vertical: 50,
// ),