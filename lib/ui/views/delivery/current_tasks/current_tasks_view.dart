import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/views/delivery/current_tasks/current_tasks_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/open_map_button.dart/open_map_button.dart';

class CurrentTasksView extends StatelessWidget {
  const CurrentTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrentTasksViewModel>.reactive(
      onModelReady: (model) => model.loadLatestRequests(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: <Widget>[
            HeaderBar(
              model: model,
              headerText:
                  'You have ${model.getCurrentTasksCount()} task(s)',
            ).padding(
              bottom: 10.h,
            ),
            model.getCurrentTasksCount() > 0
                ? const OpenMapButton()
                : const SizedBox.shrink(),
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
                    itemCount: model.isCurrentTasksEmpty ||
                            model.isBusy
                        ? 1
                        : model.currentTasksList.requestList.length,
                    itemBuilder: (context, index) {
                      return model.isCurrentTasksEmpty
                          ? const Text(
                                  'You have not accepted any tasks!')
                              .alignment(Alignment.center)
                          : model.isBusy
                              ? SizedBox(
                                  width: 40.w,
                                  height: 40.w,
                                  child:
                                      const CircularProgressIndicator(),
                                ).alignment(Alignment.center)
                              : DeliveryRequestItem(
                                  deliveryRequest: model
                                      .currentTasksList
                                      .requestList[index],
                                  isUserTask: true,
                                );
                    },
                  )),
            )
          ].toColumn().padding(top: 30.h, horizontal: 25.w),
        ),
      ),
      viewModelBuilder: () => CurrentTasksViewModel(),
    );
  }
}
