import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/views/deliver_for_others/deliver_for_others_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/deliver_for_others_header.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';

class DeliverForOthersView extends StatelessWidget {
  const DeliverForOthersView({Key? key}) : super(key: key);

  Widget _howToDeliverCard(DeliverForOthersViewModel model) {
    return <Widget>[
      const Text(
        'Learn How Delivery Works!',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ).padding(top: 20, bottom: 10),
      SvgPicture.asset(
        model.deliveryPersonAsset,
        semanticsLabel: 'Delivery Person',
        width: 220,
      ).padding(bottom: 20),
    ]
        .toColumn()
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25)
        .borderRadius(all: 25, animate: true)
        .elevation(
          model.cardPressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: const Color(0x40000000),
        )
        .gestures(
          onTapChange: (tapStatus) =>
              model.updateCardPressedStatus(tapStatus),
          onTap: () {},
        )
        .scale(all: model.cardPressed ? 0.95 : 1.0, animate: true)
        .animate(const Duration(milliseconds: 150), Curves.easeOut)
        .padding(vertical: 40);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeliverForOthersViewModel>.reactive(
      onModelReady: (model) => model.loadLatestRequests(),
      builder: (context, model, child) => Scaffold(
        body: <Widget>[
          _howToDeliverCard(model),
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
                itemCount: model.isRequestEmpty || model.isBusy
                    ? 1
                    : model.latestRequestList.length,
                itemBuilder: (context, index) {
                  return model.isRequestEmpty
                      ? const Text(
                          'There are no requests at the moment!')
                      : model.isBusy
                          ? const SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(),
                            ).alignment(Alignment.center)
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