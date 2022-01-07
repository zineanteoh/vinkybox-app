import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/views/delivery/my_packages/my_packages_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';

// TODO: duplicate this into my_current_packages_view and package_history_view
class MyPackagesView extends StatelessWidget {
  const MyPackagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyPackagesViewModel>.reactive(
      onModelReady: (model) => model.loadLatestRequests(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: <Widget>[
            HeaderBar(
              model: model,
              headerText: model.getMyPackagesCount() == 0
                  ? 'My Packages'
                  : 'My Packages (${model.getMyPackagesCount()})',
            ),
            Expanded(
              child: SmartRefresher(
                header: const ClassicHeader(
                  completeText: 'My packages is up to date!',
                  idleText: 'Pull to Refresh',
                  refreshingText: 'Fetching My Packages...',
                ),
                enablePullDown: true,
                controller: model.refreshController,
                onRefresh: model.onRefresh,
                child: ListView.builder(
                  itemCount: model.isMyPackagesEmpty || model.isBusy
                      ? 1
                      : model.myPackagesList.length,
                  itemBuilder: (context, index) {
                    return model.isMyPackagesEmpty
                        ? const Text(
                                'You have not requested any packages!')
                            .alignment(Alignment.center)
                        : model.isBusy
                            ? const Center(
                                child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child:
                                        CircularProgressIndicator()),
                              )
                            : DeliveryRequestItem(
                                deliveryRequest:
                                    model.myPackagesList[index]);
                  },
                ),
              ),
            ),
          ].toColumn().padding(left: 20.0, right: 20.0, top: 50.0),
        ),
      ),
      viewModelBuilder: () => MyPackagesViewModel(),
    );
  }
}
