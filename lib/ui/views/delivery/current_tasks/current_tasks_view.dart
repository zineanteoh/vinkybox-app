import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/shared/app_colors.dart';
import 'package:vinkybox/ui/views/delivery/current_tasks/current_tasks_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/delivery_request_item/delivery_request_item.dart';
import 'package:vinkybox/ui/widgets/smart_widgets/open_map_button.dart/open_map_button.dart';

class CurrentTasksView extends StatelessWidget {
  const CurrentTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CurrentTasksViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: <Widget>[
            HeaderBar(
              model: model,
              headerText: 'Current Tasks',
            ),
            const OpenMapButton(),
            Text('You have ${model.getCurrentTasksCount()} task(s)',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 20))
                .alignment(Alignment.center)
                .padding(top: 20),
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
                    itemCount:
                        model.isCurrentTasksEmpty || model.isBusy
                            ? 1
                            : model.currentTasksList.length,
                    itemBuilder: (context, index) {
                      return model.isCurrentTasksEmpty
                          ? const Text(
                                  'You have not accepted any tasks!')
                              .alignment(Alignment.center)
                          : model.isBusy
                              ? const Center()
                              : DeliveryRequestItem(
                                  deliveryRequest:
                                      model.currentTasksList[index],
                                  isUserTask: true,
                                );
                    },
                  )),
            )
          ].toColumn().padding(left: 20, right: 20, top: 50),
        ),
      ),
      viewModelBuilder: () => CurrentTasksViewModel(),
    );
  }
}
