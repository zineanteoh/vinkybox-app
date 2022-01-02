import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:vinkybox/ui/views/delivery/my_packages/my_packages_viewmodel.dart';
import 'package:vinkybox/ui/widgets/dumb_widgets/header_bar.dart';

class MyPackagesView extends StatelessWidget {
  const MyPackagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyPackagesViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: <Widget>[
            HeaderBar(
              model: model,
              headerText: "My Packages",
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
                  itemCount: 0,
                  itemBuilder: (context, index) => Column(
                    children: [
                      // my packages children
                    ],
                  ),
                ),
              ),
            )
          ].toColumn().padding(left: 20.0, top: 50.0),
        ),
      ),
      viewModelBuilder: () => MyPackagesViewModel(),
    );
  }
}
